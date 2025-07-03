extends Node

var battle_manager

var active: bool = true

var text_box: Label

var purify_button: TextureRect
var item_button: TextureRect
var cleanse_button: TextureRect
var tag_button: TextureRect

@export var purify_button_off: Texture
@export var purify_button_on: Texture
@export var item_button_off: Texture
@export var item_button_on: Texture
@export var cleanse_button_off: Texture
@export var cleanse_button_on: Texture
@export var tag_button_off: Texture
@export var tag_button_on: Texture

var row = 0
var col = 0

func _ready() -> void:
	battle_manager = get_parent()
	
	text_box = get_node("TextBox/Label")
	
	purify_button = get_node("Buttons/Purify")
	item_button = get_node("Buttons/Item")
	cleanse_button = get_node("Buttons/Cleanse")
	tag_button = get_node("Buttons/Tag")
	
	row = 0
	col = 0

func update_buttons() -> void:
	purify_button.texture = purify_button_off
	item_button.texture = item_button_off
	cleanse_button.texture = cleanse_button_off
	tag_button.texture = tag_button_off
	if (row == 0 && col == 0):
		purify_button.texture = purify_button_on
	elif (row == 1 && col == 0):
		item_button.texture = item_button_on
	elif (row == 0 && col == 1):
		cleanse_button.texture = cleanse_button_on
	elif (row == 1 && col == 1):
		tag_button.texture = tag_button_on
		

func _input(event: InputEvent) -> void:
	if (active):
		if (event.is_action_pressed("Right")):
			col += 1
			if (col > 1):
				col = 0
			update_buttons()
		elif (event.is_action_pressed("Left")):
			col -= 1
			if (col < 0):
				col = 1
			update_buttons()
		elif (event.is_action_pressed("Down")):
			row += 1
			if (row > 1):
				row = 0
			update_buttons()
		elif (event.is_action_pressed("Up")):
			row -= 1
			if (row < 0):
				row = 1
			update_buttons()
		elif (event.is_action_pressed("Special")):
			row = 0
			col = 0
			update_buttons()
			battle_manager.progress()
