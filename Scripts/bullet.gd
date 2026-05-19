extends Node2D

var speed: int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta





func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if the body we collided with is the TileMap

	if body is TileMap or body is TileMapLayer:
		$Bullet_Sprite.visible = false
		$Boom.restart()
		get_node("Boom").emitting = true
		await $Boom.finished
		queue_free()
