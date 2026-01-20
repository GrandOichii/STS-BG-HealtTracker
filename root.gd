extends CanvasLayer

@export var TheIroncladColor: Color
@export var TheSilentColor: Color
@export var TheDefectColor: Color
@export var TheWatcherColor: Color

@onready var _color_map = {
	'The Ironclad': TheIroncladColor,
	'The Silent': TheSilentColor,
	'The Defect': TheDefectColor,
	'The Watcher': TheWatcherColor,
}

@onready var _character_specific = {
	'The Silent': %TheSilent,
	'The Defect': %TheDefect,
	'The Watcher': %TheWatcher,
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
	%TheWatcher,
	%TheDefect,
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
	%CharacterChoice.hide()
	%Trackers.show()
	%Trackers.color = _color_map[c_name]
	if c_name == 'The Ironclad':
		return
	%CharacterSpecific.show()
	_character_specific[c_name].show()
	
	_on_end_combat_button_pressed()

# signal connections

func _on_end_turn_button_pressed() -> void:
	for node in _end_turn_resets:
		node.soft_reset()

func _on_end_turn_keep_block_button_pressed() -> void:
	for node in _end_turn_keep_block_resets:
		node.soft_reset()

func _on_end_combat_button_pressed() -> void:
	for node in _end_combat_resets:
		node.reset()

func _on_the_ironclad_open_request() -> void:
	load_character('The Ironclad')

func _on_the_silent_open_request() -> void:
	load_character('The Silent')

func _on_the_defect_open_request() -> void:
	load_character('The Defect')

func _on_the_watcher_open_request() -> void:
	load_character('The Watcher')
