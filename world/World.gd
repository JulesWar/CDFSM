extends Node

var food = preload("res://food/Food.tscn")
var item = preload("res://item/Item.tscn")

func _process(delta):
	pass



func _on_food_respawn_timeout():
	randomize()
	if randf() > .05:
		var f = food.instance()
		add_child(f)
		f.food_type = randi() % 2
		f.position = Vector2(global.screen.x + 25, global.row[( randi() % 4 ) + 1])
	else:
		var i = item.instance()
		add_child(i)
		i.item_type = randi() % 2
		i.position = Vector2(global.screen.x + 25, global.row[( randi() % 4 ) + 1])