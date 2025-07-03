extends Node

# Hello world!
# Lmao

const SIZES = [
	Vector2i(800, 600),
	Vector2i(1024, 768)
]

var current_size = 0

var insta_exit: bool = true

func _init() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("Quit")):
		if (insta_exit):
			get_tree().quit()
	elif (event.is_action_pressed("Fullscreen")):
		if (DisplayServer.window_get_mode() == DisplayServer.WindowMode.WINDOW_MODE_WINDOWED):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif (event.is_action_pressed("Resize")):
		current_size += 1
		if (current_size > SIZES.size() - 1):
			current_size = 0
		DisplayServer.window_set_size(SIZES[current_size])
