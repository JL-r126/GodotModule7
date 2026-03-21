extends Control

@onready var body: TextureRect = %body
@onready var expression: TextureRect = %expression
@onready var v_box_container: VBoxContainer = %VBoxContainer
@onready var h_box_container: HBoxContainer = %HBoxContainer
@onready var sophia: Button = %Sophia
@onready var pink: Button = %Pink
@onready var angry: Button = %angry
@onready var h_box_container_2: HBoxContainer = %HBoxContainer2
@onready var regular: Button = %regular
@onready var happy: Button = %happy
@onready var sad: Button = %sad
@onready var color_picker_button: ColorPickerButton = %ColorPickerButton

@onready var bodies: Dictionary[Button, Texture2D] = {
	sophia: preload("res://assets/sophia.png"),
	pink: preload("res://assets/pink.png")
}

@onready var expressions: Dictionary[Button, Texture2D] = {
	happy: preload("res://assets/emotion_happy.png"), 
	regular: preload("res://assets/emotion_regular.png"),
	sad: preload("res://assets/emotion_sad.png"),
	angry: preload("res://assets/extras/emotion_angry.png"),
}

var test: Dictionary = {
	PI: Vector2.ZERO,
	_ready: "hi",
	["hi", 7, PI]: 8
}

func _ready() -> void:
	body.texture = bodies[pink]
	expression.texture = preload("res://assets/emotion_happy.png")
	test[_ready] += "l000"
	print(test)
	
	for item in expressions.keys():
		item.pressed.connect(func() -> void:
			expression.texture = expressions[item])
	for item in bodies.keys():
		item.pressed.connect(func() -> void:
			body.texture = bodies[item])
	"""
	sophia.pressed.connect(func() -> void:
		body.texture = bodies["sophia"]
	)
	pink.pressed.connect(func() -> void:
		body.texture = bodies["pink"]
	)
	angry.pressed.connect(func() -> void:
		expression.texture = expressions[angry]
	)
	regular.pressed.connect(func() -> void:
		expression.texture = expressions[regular]
	)
	happy.pressed.connect(func() -> void:
		expression.texture = expressions[happy]
	)
	sad.pressed.connect(func() -> void:
		expression.texture = expressions[sad]
	)
	"""
func _process(_delta: float) -> void:
	body.modulate = color_picker_button.color
