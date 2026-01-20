extends HBoxContainer

var _value: int = 0

func _ready() -> void:
	update_display()

func update_display():
	%Display.text = str(_value)

func mod_value(mod):
	_value += mod
	if _value < 0:
		_value = 0
	update_display()

# signal connections

func _on_sub_5_button_pressed() -> void:
	mod_value(-5)

func _on_sub_1_button_pressed() -> void:
	mod_value(-1)

func _on_add_1_button_pressed() -> void:
	mod_value(1)

func _on_add_5_button_pressed() -> void:
	mod_value(5)
