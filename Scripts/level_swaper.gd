extends Node2D
@export var next_level = ""

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("aaaaaaa")
	if body.is_in_group("player"):
		#$LevelComplete.play()
		await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file(next_level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
