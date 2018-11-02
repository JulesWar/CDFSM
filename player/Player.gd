extends Area2D

var can_move = true
var row_no = 3
var next_row = 0
enum mode_types {DOG, CAT}
var mode = DOG

func _ready():
	position.x = global.col[1]
	position.y = global.row[3]

func _process(delta):
	if Input.is_action_pressed("ui_up") and can_move and row_no != 1:
		next_row = row_no - 1
		can_move = false
		row_no = move(row_no, next_row)
	if Input.is_action_pressed("ui_down") and can_move and row_no != 5:
		next_row = row_no + 1
		can_move = false
		row_no = move(row_no, next_row)
	if Input.is_action_just_pressed("ui_select") and can_move:
		can_move = false
		change_mode()
	draw_mode()

func change_mode():
	$change_tween.interpolate_property(self,
								"scale",
								Vector2(1,1),
								Vector2(-1,1),
								.5,
								Tween.TRANS_BACK,
								Tween.EASE_IN_OUT
								)
	$change_tween.start()


func move(act_row, next_row):
	$move_tween.interpolate_property(self,
								"position",
								Vector2(global.col[1],global.row[act_row]),
								Vector2(global.col[1],global.row[next_row]),
								.5,
								Tween.TRANS_BACK,
								Tween.EASE_IN_OUT
								)
	$move_tween.start()
	return next_row

func draw_mode():
	match mode:
		DOG:
			modulate = Color(1,0,0,.8)
		CAT:
			modulate = Color(0,0,1,.8)

func _on_Player_area_entered(area):
	if area.name == 'Food_body':
		if ( area.get_parent().food_type == global.MEAT and mode == DOG ) or (area.get_parent().food_type == global.FISH and mode == CAT ):
			area.get_parent().queue_free()
	elif area.name == 'Item_body':
		if ( area.get_parent().item_type == global.BALL and mode == DOG ) or (area.get_parent().item_type == global.YARN and mode == CAT ):
			area.get_parent().queue_free()
			$stun_time.start()
			can_move = false

func _on_move_tween_tween_completed(object, key):
	can_move = true

func _on_change_tween_tween_completed(object, key):
	if mode == DOG:
		mode = CAT
	else:
		mode = DOG
	can_move = true

func _on_stun_time_timeout():
	can_move = true
