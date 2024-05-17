extends Node

var game_started: bool

var player_scene = preload("res://player.tscn")
var player_ids: Array = []
var player_states: Dictionary = {}
var player_scenes: Dictionary = {}


func on_lobby_created():
	print_debug("game started")
#	game_started = true
	Playroom.on_player_join(JavaScript.create_callback(self, "on_player_join"))


func on_player_join(args):
	var player_state = args[0];
	var profile_data = player_state.getProfile()
	var pos = Vector2(rand_range(100, 320), rand_range(100, 320))

	print_debug("player dump:", JS.stringify(profile_data))

	if profile_data.color:
		player_state.setState("color", profile_data.color.hexString)
	player_state.setState("px", pos.x)
	player_state.setState("py", pos.y)

	player_ids.append(player_state.id)
	player_states[player_state.id] = player_state

	var instance = player_scene.instance()
	instance.player_state = player_state
	player_scenes[player_state.id] = instance
	get_tree().get_nodes_in_group("entities").front().add_child(instance)
	instance.position = pos

	print_debug("player dump2:", JS.stringify(player_state.getProfile()))
	print_debug("player.color:", player_state.getState("color"))


func _on_changed_color(player_id: String, new_color: String) -> void:
	player_states[player_id].setState("color", new_color)


func on_player_quit(args):
	var player_state = args[0];
	print_debug("player quit: ", player_state.id)
