extends CharacterBody2D

@export var jump_vel: float = 1200.0
const SPEED = 300.0
var JUMP_VELOCITY = jump_vel * -1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("boost") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(_delta: float) -> void:
	$body2.modulate = %ColorPickerButton.color
	$body2.texture = %body.texture
	$body2/face.texture = %expression.texture
