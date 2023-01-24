extends Node2D

var velocity = 200

func _ready():
	pass


func _process(delta):
	var direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var direction_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	translate(Vector2(direction_x, direction_y) * delta * velocity)
	
	global_position.x = clamp(global_position.x, 50, 350)
	global_position.y = clamp(global_position.y, 50, 850)
		
	
