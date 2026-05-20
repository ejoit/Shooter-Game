extends Node2D
@export var move_x = 5
@export var move_y = 5
@export var time = 5

func _ready():
	var tween = create_tween()
	plat_move(tween)

func plat_move(tween):
	while true:
		tween.tween_property(self, "position", position + Vector2(move_x, move_y), time)
		tween.tween_property(self, "position", position + Vector2(-move_x, -move_y), time)
