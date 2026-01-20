extends CanvasLayer

@onready var _character_specific = {
	'The Silent': %TheSilent,
}

@onready var _end_turn_resets = [
	%Block,
	%Energy,
	%Strength,
]

@onready var _end_turn_keep_block_resets = [
	%Energy,
	%Strength,
]

@onready var _end_combat_resets = [
	%Block,
	%Energy,
	%Strength,
	%Weakened,
	%Vulnerable,
	%TheSilent,
#	TODO
]

# the watcher: mantra tracking + stances
# the defect: orb tracking + more orbs

# ctrl+z feature (button for mobile)

func _ready() -> void:
	%CharacterSpecific.hide()
	for i in range(%CharacterSpecific.get_child_count()):
		%CharacterSpecific.get_child(0).set_visible(false)
	#load_character('The Ironclad')

func load_character(c_name: String):
	if c_name == 'The Ironclad':
		return
	%CharacterSpecific.show()
	_character_specific[c_name].show()

# signal connections

func _on_end_turn_button_pressed() -> void:
	for node in _end_turn_resets:
		node.reset()

func _on_end_turn_keep_block_button_pressed() -> void:
	for node in _end_turn_keep_block_resets:
		node.reset()

func _on_end_combat_button_pressed() -> void:
	for node in _end_combat_resets:
		node.reset()
