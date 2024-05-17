extends Node

var _JSON: JavaScriptObject = JavaScript.get_interface("JSON")

const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var _rng = RandomNumberGenerator.new()


func _ready() -> void:
	_rng.randomize()


func _get_random_identifier(size: int = 6) -> String:
	var identifier: String
	for i in range(size):
		identifier += letters[_rng.randi_range(0, len(letters)-1)]
	return identifier


func _create_object(identifier: String, value: Dictionary) -> void:
	var parsed_value = JSON.print(value)
#	print_debug("obj %s: %s" % [identifier, parsed_value])
	JavaScript.eval("var %s = %s;" % [identifier, parsed_value], true)


func _get(identifier: String) -> JavaScriptObject:
	return JavaScript.get_interface(identifier)


func Object(value: Dictionary) -> JavaScriptObject:
	var id = _get_random_identifier()
	_create_object(id, value)
	return _get(id)


func stringify(object: JavaScriptObject) -> String:
	return _JSON.stringify(object)
