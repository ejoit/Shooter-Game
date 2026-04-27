extends State


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	print("jump test")
	
func process_input(event:InputEvent) -> State:
	#return "inset stat name from that exort
	#if Input.aation preess bleh bleh do retun state nmae
	return null
	
func process_physics(delta: float) -> State:
	parent.velocity.y += GRAVITY * delta
	parent.move_and_slide()
	

	return null
	
