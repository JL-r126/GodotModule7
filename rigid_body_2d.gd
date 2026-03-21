extends RigidBody2D
@onready var char = $"../CharacterBody2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta: float) -> void:
	if char.move_and_slide():
		for i in char.get_slide_collision_count():
			var col = char.get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -500)
