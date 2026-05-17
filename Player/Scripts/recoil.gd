extends State
@onready var player: CharacterBody2D
signal Shoot



@onready var shoot_sound: AudioStreamPlayer2D = $"../../Audio/Shoot"
func  enter() -> void:
	shoot_sound.play()

	player = state_machine.get_parent()
	var local_recoil_direction = player.global_position.direction_to(player.get_global_mouse_position())
	player.velocity = -400 * local_recoil_direction
	Global.hit_stop_short()


	player.Shoot.emit()
	
func physics_update(_delta: float) -> void:
	await get_tree().create_timer(0.08).timeout
	state_machine.change_state("fall")
