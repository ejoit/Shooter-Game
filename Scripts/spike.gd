extends Node2D
#TEST 2


@onready var deathpar = $Deathpar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_area_2d_body_entered(body: Node2D) -> void:
	var coords = body.global_position
	Global.death(body, coords)
