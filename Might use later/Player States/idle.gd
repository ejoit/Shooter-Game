extends State
@export
var jump_state: State

# Called when the node enters the scene tree for the first time.


# @expor var name_state: state
#above is where i will add staets transition to
#do it for each state you can transition to
#go to the node of this state and link the correct nodes to shift to

func enter() -> void:
	super() # got no clue what this dose tutorial said somthing bout animation later on
	#will leave in that for that reason
	parent.velocity.x = 0
	print("idle and probs work")

func process_input(event:InputEvent) -> State:
	#return "inset stat name from that exort
	#if Input.aation preess bleh bleh do retun state nmae

		# change to air/ fall state
	return null


func process_physics(delta: float) -> State:
	parent.velocity.y += GRAVITY * delta
	parent.move_and_slide()
	
	if parent.is_on_floor():
		return jump_state

	return null
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
