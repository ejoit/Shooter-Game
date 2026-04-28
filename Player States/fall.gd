extends State
@export 
var idle_state: State

var speed = 10000


func enter() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func process_physics(delta: float) -> State:
	var direction := Input.get_axis("ui_left", "ui_right")
	parent.velocity.x = direction * speed
	
	parent.velocity.y += GRAVITY * delta
	
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return idle_state

	
	return null
	
func process_input(event: InputEvent)  -> State:
	return null

func process_frame(delta: float)-> State:

	return null

func exit()-> void:
	pass
	
