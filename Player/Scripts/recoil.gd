extends State
@onready var player: CharacterBody2D
signal Shoot


@onready var shoot_sound: AudioStreamPlayer2D = $"../../Audio/Shoot"

func  enter() -> void:
	shoot_sound.play()
	player = state_machine.get_parent()
	var mouse_angle = player.global_position.angle_to_point(player.get_global_mouse_position())
	var angle_deg = rad_to_deg(mouse_angle)
	var angle = wrapf(angle_deg, 0.0, 360.0)
	var amount_of_directions = 32
	var section_size = 360.0 / amount_of_directions
	var snapped_angle = floor(angle / section_size) * section_size
	var recoil_direction = Vector2.RIGHT.rotated(
	deg_to_rad(snapped_angle)
)
	print(angle)
	
	player.velocity = -520 * recoil_direction 
	Global.hit_stop_short()
	Shoot.emit()
	player.Shoot.emit()
	await get_tree().create_timer(0.03).timeout
	state_machine.change_state("fall")
	return

	
func physics_update(_delta: float) -> void:
	pass
