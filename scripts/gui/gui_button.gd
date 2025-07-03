class_name GUIButton extends Label

const DEFAULT_COLOR: Color = Color(255, 255, 255)
const ACTIVE_COLOR: Color = Color(255, 255, 0)

func set_active(active: bool) -> void:
	if (active):
		add_theme_color_override("font_color", ACTIVE_COLOR)
	else:
		add_theme_color_override("font_color", DEFAULT_COLOR)

func click() -> void:
	printerr("UIButton is an abstract class. Inherit from it and override 'click' method.")
