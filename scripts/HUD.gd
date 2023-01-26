extends Node2D

var score = 0
var life = 3

export(Texture) var texture
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/RichTextLabel.set_text("SCORE" + str(score).pad_zeros(10))

func setScore(points):
	score += points
	$CanvasLayer/RichTextLabel.set_text("SCORE" + str(score).pad_zeros(10))

func setDamage(damage):
	life -= damage
	if life <= 0:
		update()
		
func _draw():
	for n in range(0, life) :
		draw_texture(texture, Vector2(n * (texture.get_width() + 10),10))
