extends Node2D

@onready var deathpar = $Deathpar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_area_2d_body_entered(body: Node2D) -> void:
	var coords = body.global_position
	if body.is_in_group("player"):

		body.get_node("Sprite2D").hide()
		body.get_node("Gun-1").hide()
		deathpar.global_position = coords
		$Deathpar.restart()
		body.get_node("CollisionShape2D").disabled = true
		get_node("Deathpar").emitting = true
		body.process_mode = body.PROCESS_MODE_DISABLED
		$SpikeDeath.play()
		await get_tree().create_timer(0.3).timeout
		get_tree().reload_current_scene()
