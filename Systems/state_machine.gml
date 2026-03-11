function state_machine(starting_state) constructor {
	owner = other
	state = starting_state
	states = {}
	
	static run = function(state_function) {
		var curr_state = struct_get(states, state)
		
		if	(is_undefined(curr_state)) {
			show_debug_message($"State {state} doesn't exist")
			return self
		}
		
		var fun = struct_get(curr_state, state_function)
		
		if (is_undefined(fun)) {
			show_debug_message($"Function {state_function} of state {state} doesn't exist")
			return self
		}
		
		method_call(fun)
		
		return self
	}
	
	static change = function(new_state) {
		run("leave")
		
		state = new_state
		
		run("enter")
		
		return self
	}
	
	static add = function(new_state, state_struct) {
		struct_set(self.states, new_state, new fsm_state(state_struct))
		
		if (new_state == state) run("enter")
		
		return self
	}
}

function fsm_state(struct) constructor {
	fsm = other
	static enter = function(){}
	static leave = function(){}
	
	var names = struct_get_names(struct)
	var n = array_length(names)
	
	for (var i = 0; i<n; i++) {
		var key = names[i]
		var value = struct[$ key]
		
		self[$ key] = method(fsm.owner, value)
	}
}
