extends Area2D

var food_type

func _ready():
	food_type = get_parent().food_type