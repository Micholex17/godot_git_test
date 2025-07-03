extends CharacterBody2D

const SPEED: float = 200.0

var active: bool = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (active):
		velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
		move_and_slide()
