@tool
extends RayCast2D

@export var cast_speed:= 70000
@export var max_length := 5
@export var color :=Color.WHITE: set = set_color
@onready var line_2d : Line2D = $Line2D

@export var time_as_green: float = 0 
@export var time_as_red: float = 0


var lazer_safe_mode: bool = true

func _ready() -> void:
	set_color(color)
	lazer_cycle()
	

func set_color(new_color: Color) -> void:
	color = new_color
	if line_2d == null:
		return
	line_2d.modulate = new_color
	
func lazer_cycle():
	while true:
		lazer_safe_mode = false
		set_color(Color.RED)
		await get_tree().create_timer(time_as_red).timeout
		
		lazer_safe_mode = true
		set_color(Color.DARK_GREEN)
		await get_tree().create_timer(time_as_green).timeout


	
func  _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	target_position.y = move_toward(
		target_position.y,
		max_length,
		cast_speed * delta,
	)
	
	var laser_end_position := target_position
	force_raycast_update()
	if is_colliding():
		laser_end_position = to_local(get_collision_point())
		var hit = get_collider()

		if hit and hit.is_in_group("player"):
			if lazer_safe_mode == false:
				$Audio/death.play()
				Global.death(hit, get_collision_point())
			else:
				pass

	line_2d.set_point_position(1, laser_end_position)
	
	
	
