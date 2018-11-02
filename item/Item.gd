extends Node2D

var item_type = null

var velocity = 300
var border

func _ready():
	border = $Item_body/Sprite.texture.get_size() / 2

func _process(delta):
	position.x -= velocity * delta
	draw_mode()
	if position.x + border.x < 0:
		queue_free()

func draw_mode():
	match item_type:
		global.BALL:
			modulate = Color(1,0,0,.8)
		global.YARN:
			modulate = Color(0,0,1,.8)