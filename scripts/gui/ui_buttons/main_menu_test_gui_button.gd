extends GUIButton

var label: Label
var x: int = 0

func _ready() -> void:
	label = find_child("Label")

func _process(_delta: float) -> void:
	label.text = str(x) + "%"

func click() -> void:
	x += 1
