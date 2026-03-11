/// @desc Sets a value in a nested struct using a dot path. Creates intermediate structs if they don't exist. Returns the set value on success or undefined if the path cannot be traversed.
/// @arg {Struct} struct The root struct to start traversing from
/// @arg {string} string_path Dot-separated path string (e.g., "system.shop.buy.value")
/// @arg {Any} value The value to set at the specified path
function struct_path_set(struct, string_path, value) {
    var parts = string_split(string_path, ".")
    
    var current_level = struct
    for (var i = 0, n = array_length(parts); i < n - 1; i++) {
        if (!is_struct(current_level) || is_undefined(current_level)) return undefined
        
        var key = parts[i]
        
        // If the next part doesn't exist or isn't a struct, create an empty struct
        if (!struct_exists(current_level, key) || !is_struct(struct_get(current_level, key))) {
            struct_set(current_level, key, {})
        }
        
        current_level = struct_get(current_level, key)
    }
    
    if (is_struct(current_level) && !is_undefined(current_level)) {
        var last_key = parts[array_length(parts) - 1]
        struct_set(current_level, last_key, value)
        return value
    }
    
    return undefined
}