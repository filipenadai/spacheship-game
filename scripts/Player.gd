extends Node2D

var velocity = 200

var laser_preload = preload("res://scenes/Laser.tscn")


func _ready():
	pass


func _process(delta):
	var direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var direction_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	translate(Vector2(direction_x, direction_y) * delta * velocity)
	
	global_position.x = clamp(global_position.x, 50, get_viewport_rect().size.x - 55)
	global_position.y = clamp(global_position.y, 50, get_viewport_rect().size.y - 45)
		
	shoot()
	
func shoot():
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group('LASER').size() < 3:
			var laser = laser_preload.instance()
			laser.global_position = $Shoot_Position.global_position
			get_parent().add_child(laser)
	
	pass


func _on_Player_area_entered(area):
	Hud.setDamage(1)
