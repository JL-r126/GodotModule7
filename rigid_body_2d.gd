extends RigidBody2D
@onready var chare = $"../CharacterBody2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta: float) -> void:
	if chare.move_and_slide():
		for i in chare.get_slide_collision_count():
			var col = chare.get_slide_collision(i)
			if col.get_collider() is CharacterBody2D:
				col.get_collider().apply_force(col.get_normal() * -500)
