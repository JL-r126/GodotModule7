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

var bodies: Dictionary[String, Texture2D] = {
	"sophia": preload("res://assets/sophia.png"),
	"pink": preload("res://assets/pink.png")
}

var expressions: Dictionary[String, Texture2D] = {
	"happy": preload("res://assets/emotion_happy.png"),
	"regular": preload("res://assets/emotion_regular.png"),
	"sad": preload("res://assets/emotion_sad.png"),
	"angry": preload("res://assets/extras/emotion_angry.png"),
}

func _ready() -> void:
	body.texture = bodies["pink"]
	expression.texture = expressions["happy"]

func _process(_delta: float) -> void:
	body.modulate = color_picker_button.color
