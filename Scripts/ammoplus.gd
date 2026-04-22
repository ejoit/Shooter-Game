extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.air_shot = body.air_shot + 1
		body.wall_shot = true
		body.can_wall_slide = true
		body.cooldown_ready = false
		body.get_node("Particles/POWERUP").emitting = true
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.hide()
		$PowerUp.play()
