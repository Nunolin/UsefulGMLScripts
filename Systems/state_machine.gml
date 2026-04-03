function state_machine(starting_state = "null", _id = other.id) constructor {
	owner = _id
	state = starting_state
	states = {
		null: new fsm_state({}, self)
	}
	
	static run = function(function_name) {
		var current_state = struct_get(states, state)		
		var fun = struct_get(current_state, function_name)
		
		if (is_undefined(fun)) {
			show_debug_message($"Function {function_name} of state {state} doesn't exist")
			return
		}
		
		fun()
	}
	
	staatic change = function(new_state) {
		if (is_undefined(struct_get(states, new_state))) {
			show_debug_message($"State {new_state} doesn't exist")
			return
		}

		run("leave")
		
		state = new_state
		
		run("enter")
	}
	
	static add = function(new_state, state_struct) {
		struct_set(states, new_state, new fsm_state(state_struct, self))
		
		if (new_state == state) run("enter")
		
		return self
	}
}

function fsm_state(struct, _fsm) constructor {
	fsm = _fsm

	static NOOP = function(){}
	enter = NOOP
	leave = NOOP
	
	var names = struct_get_names(struct)
	var n = array_length(names)
	
	for (var i = 0; i<n; i++) {
		var key = names[i]
		var value = struct[$ key]
		
		self[$ key] = method(fsm.owner, value)
	}
}
