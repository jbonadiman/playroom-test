extends Node2D
class_name Player

var player_state
var speed = 100
signal changed_color

onready var label = get_node("%Label")

func _ready():
	connect("changed_color", EventManager, "_on_changed_color")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		emit_signal("changed_color", player_state.id, _generate_random_hue() )


func _process(delta):
	print_debug(delta)
#	if !EventManager.game_started:
#		return
#
#	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	Playroom.me().setState("input_x", direction.x)
#	Playroom.me().setState("input_y", direction.y)
#
#	move_and_slide(direction * speed)
#
#	player_state.setState("x", position.x)
#	player_state.setState("y", position.y)
#
#	if !Playroom.is_host():
#		position = Vector2(player_state.getState("x"), player_state.getState("y"))
#
#	var current_position = Vector2(player_state.getState("px"), player_state.getState("py"))
#
#	if Input.is_action_pressed("ui_right"):
#		current_position.x += speed * delta
#	elif Input.is_action_pressed("ui_left"):
#		current_position.x -= speed * delta
#
#	if Input.is_action_pressed("ui_up"):
#		current_position.y -= speed * delta
#	elif Input.is_action_pressed("ui_down"):
#		current_position.y += speed * delta
#
#	position = current_position
#	modulate = player_state.getState("color")
#	label.text = player_state.getProfile().name
#
#	player_state.setState("px", position.x)
#	player_state.setState("py", position.y)


func _generate_random_hue() -> String:
	var new_hue = rand_range(0.0, 1)

	var new_color = "#%s" % Color.from_hsv(new_hue, 1.0, 1.0).to_html(false)
	print_debug("new color: %s" % new_color)
	return new_color
