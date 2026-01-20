extends PanelContainer

@export var character: String
@export var image: Texture2D

func _ready() -> void:
	%Image.texture = image
	%Button.text = character
