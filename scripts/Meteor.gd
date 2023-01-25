extends Area2D

var textures = [
	preload("res://sprites/PNG/Meteors/meteorBrown_big1.png"),
	preload("res://sprites/PNG/Meteors/meteorBrown_big2.png"),
	preload("res://sprites/PNG/Meteors/meteorBrown_big3.png"),
	preload("res://sprites/PNG/Meteors/meteorBrown_big4.png"),
	preload("res://sprites/PNG/Meteors/meteorGrey_big1.png"),
	preload("res://sprites/PNG/Meteors/meteorGrey_big2.png"),
	preload("res://sprites/PNG/Meteors/meteorGrey_big3.png"),
	preload("res://sprites/PNG/Meteors/meteorGrey_big4.png"),
]

var explosion_preload = preload("res://scenes/MeteorExplosion.tscn")

var life = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Sprite.set_texture(textures[randi() % textures.size()])
	pass # Replace with function body.



func setDamage(power): 
	life -= power
	print_debug(life)
	if life <= 0:
		var explosion = explosion_preload.instance()
		explosion.global_position = global_position
		get_parent().add_child(explosion)
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
