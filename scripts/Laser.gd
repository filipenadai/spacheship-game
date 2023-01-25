extends Area2D

var explosion_preload = preload("res://scenes/LaserExplosion.tscn")

var velocity = 500
var power = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(0, -1) * delta * velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	print_debug(area)
	print_debug(area.has_method('setDamage'))
	if (area.has_method('setDamage')):
		area.setDamage(power)
		
	var explosion = explosion_preload.instance()
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	queue_free()
