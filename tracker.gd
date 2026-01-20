extends VBoxContainer
class_name Tracker
@export var image: Texture2D
@export var temp_button_enabled: bool = false
@export var reset_value: int = 0
@export var min_value: int = 0
@export var max_value: int = 10

var _value: int = 0
var _temp_mod: int = 0

func _ready() -> void:
	_value = reset_value
	
	%TempButton.visible = temp_button_enabled
	%Image.texture = image
	
	update_display()
	
func update_display():
	%Display.text = str(_value)
	
func soft_reset():
	if temp_button_enabled:
		reset_temp()
		return
	_value = reset_value
	update_display()

func reset():
	reset_temp()
	_value = reset_value
	update_display()

func reset_temp():
	_value -= _temp_mod
	_temp_mod = 0
	update_display()

# signal connections

func _on_sub_button_pressed() -> void:
	_value -= 1
	if _value < min_value:
		_value = min_value
	update_display()

func _on_add_button_pressed() -> void:
	_value += 1
	if _value > max_value:
		_value = max_value
	update_display()

func _on_temp_button_pressed() -> void:
	_temp_mod += 1
	_value += 1
	if _value > max_value:
		_value = max_value
	update_display()
