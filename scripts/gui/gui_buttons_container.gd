class_name GUIButtonsContainer extends VBoxContainer

@export
var active: bool = false

var num_of_buttons: int = 0
var selected: int = 0

const DELAY_TIME: float = 0.5

var delay: float = DELAY_TIME

func _ready() -> void:
	num_of_buttons = get_child_count()
	if (active):
		get_child(0).set_active(true)

func set_active(value: bool):
	if (value):
		selected = 0
		get_child(0).set_active(true)
		active = true
		delay = DELAY_TIME
	else:
		get_child(selected).set_active(false)
		active = false

func _process(delta: float) -> void:
	if (delay > 0):
		delay -= 1 * delta

func _input(event: InputEvent) -> void:
	if (active && delay <= 0):
		if (event.is_action_pressed("Down")):
			get_child(selected).set_active(false)
			selected += 1
			if (selected >= num_of_buttons):
				selected = 0
			get_child(selected).set_active(true)
		elif (event.is_action_pressed("Up")):
			get_child(selected).set_active(false)
			selected -= 1
			if (selected < 0):
				selected = num_of_buttons - 1
			get_child(selected).set_active(true)
		elif (event.is_action_pressed("Confirm")):
			get_child(selected).click()
