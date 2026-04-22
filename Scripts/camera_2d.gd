extends Camera2D

@export var randomStrength: float = 15
@export var shakeFade: float = 5

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # RSeplace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength =lerpf(shake_strength, 0, shakeFade * delta)
		
		offset = randomOffset()
		
func apply_Shake():
	shake_strength = randomStrength
func randomOffset():
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))


	


func _on_player_shoot() -> void:
	apply_Shake()
