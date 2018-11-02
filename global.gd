extends Node

enum food_types {MEAT, FISH}
enum item_types {BALL, YARN}

var row = {1: 0,
			2: 0,
			3: 0,
			4: 0,
			5: 0}
var col = {1: 0}
var screen = Vector2()

func _ready():
	screen = get_viewport().size
	init_row()
	init_col()

func init_row():
	global.row[1] = screen.y / 10
	global.row[2] = global.row[1] + screen.y / 5
	global.row[3] = global.row[2] + screen.y / 5
	global.row[4] = global.row[3] + screen.y / 5
	global.row[5] = global.row[4] + screen.y / 5

func init_col():
	global.col[1] = screen.x / 10