extends PanelContainer

signal open_request

@export var character: String
@export var image: Texture2D

func _ready() -> void:
	%Image.texture = image
	%Button.text = character

func _on_button_pressed() -> void:
	open_request.emit()
