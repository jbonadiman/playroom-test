extends Node

var _instance = JavaScript.get_interface("Playroom")
var jsBridgeReferences = []


func insert_coin(
	options: Dictionary,
	on_launch_callback: JavaScriptObject = null,
	on_disconnect_callback: JavaScriptObject = null) -> void:

	print_debug("inside insert_coin")

	if on_launch_callback:
		print_debug("on_launch_callback detected")
		jsBridgeReferences.append(on_launch_callback)

	if on_disconnect_callback:
		jsBridgeReferences.append(on_disconnect_callback)

	_instance.insertCoin(
		JS.Object(options),
		on_launch_callback,
		on_disconnect_callback)


func on_player_join(callback: JavaScriptObject) -> void:
	if not callback:
		push_warning("on_player_join: callback not defined")
		return

	jsBridgeReferences.append(callback)
	_instance.onPlayerJoin(callback)


func set_player_state(state: String, value) -> void:
	_instance.me().setState(state, value)


func get_player_state(state):
	return _instance.me().getState(state)


func is_host() -> bool:
	return _instance.isHost()
