extends Control

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var next_button: Button = %nextButton
@onready var previous_button: Button = %previousButton
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var body: TextureRect = %body
@onready var expression: TextureRect = %expression


var dict: Dictionary = {
	"happy": preload("res://assets/emotion_happy.png"), 
	"regular": preload("res://assets/emotion_regular.png"),
	"sad": preload("res://assets/emotion_sad.png"),
	"angry": preload("res://assets/extras/emotion_angry.png"),
}

var dict2: Dictionary = {
	"sophia": preload("res://assets/sophia.png"),
	"pink": preload("res://assets/pink.png")
}

var dialogue_items: Array[Dictionary] = [
	{
		"text": "[rainbow val=0.9]talking loud[/rainbow]",
		"expression": dict["regular"],
		"character": dict2["sophia"]
	},
	{
		"text": "[b]hello[/b] world",
		"expression": dict["happy"],
		"character": dict2["sophia"]
	},
	{
		"text": "[shake]this is code[/shake]",
		"expression": dict["sad"],
		"character": dict2["pink"]
	},
	{
		"text": "[wave]something else[/wave]",
		"expression": dict["angry"],
		"character": dict2["sophia"]
	},
	{
		"text": "[tornado freq=8.0][b]goodbye, farewell![/b][/tornado]",
		"expression": dict["angry"],
		"character": dict2["pink"]
	},
	{
		"text": "[b][i]I wrote this myself![/i][/b]",
		"expression": dict["regular"],
		"character": dict2["sophia"]
	},
]

var current_item_index := 0

func show_text() -> void:
	var current_item := dialogue_items[current_item_index]
	rich_text_label.text = current_item["text"]
	expression.texture = current_item["expression"]
	body.texture = current_item["character"]
	rich_text_label.visible_ratio = 0.0
	body.modulate = "ffffff00"
	body.position.x = 190.0
	var char_tween := create_tween()
	char_tween.set_parallel()
	char_tween.tween_property(body, "modulate:a", 1.0, 0.2)
	char_tween.tween_property(body, "position:x", 2.0, 0.3)
	var tween := create_tween()
	var text_appearing_duration: float = current_item['text'].length() / 30.0
	tween.tween_property(rich_text_label, "visible_ratio", 1.0, text_appearing_duration)
	var sound_max_offset := audio_stream_player.stream.get_length() - text_appearing_duration
	var sound_start_position := randf() * sound_max_offset
	audio_stream_player.play(sound_start_position)
	tween.finished.connect(audio_stream_player.stop)
	
	next_button.disabled = true
	previous_button.disabled = true
	tween.finished.connect(func() -> void:
		next_button.disabled = false
		previous_button.disabled = false
	)

func _ready() -> void:
	show_text()
	next_button.pressed.connect(advance)
	previous_button.pressed.connect(previous)

func advance() -> void:
	current_item_index += 1
	if current_item_index == dialogue_items.size():
		current_item_index = 0
	show_text()

func previous() -> void:
	current_item_index -= 1
	if current_item_index == -1:
		current_item_index = dialogue_items.size() - 1
	show_text()
