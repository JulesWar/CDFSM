extends Node2D


var food_type = null

var velocity = 200
var border

func _ready():
	border = $Food_body/Sprite.texture.get_size() / 2

func _process(delta):
	position.x -= velocity * delta
	draw_mode()
	if position.x + border.x < 0:
		queue_free()

func draw_mode():
	match food_type:
		global.MEAT:
			modulate = Color(1,0,0,.8)
		global.FISH:
			modulate = Color(0,0,1,.8)