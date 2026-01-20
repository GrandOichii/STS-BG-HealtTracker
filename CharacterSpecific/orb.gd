extends HBoxContainer

@export var orb_images: Array[Texture2D] = []

var _state: int = 0

func set_state(state: int):
	_state = state
	update_display()
	
func update_display():
	%Image.texture = orb_images[_state]

# signal connections

func _on_left_button_pressed() -> void:
	_state -= 1
	if _state < 0 :
		_state = len(orb_images) - 1
	update_display()

func _on_right_button_pressed() -> void:
	_state += 1
	if _state >= len(orb_images):
		_state = 0
	update_display()
