@icon("res://assets/bullet.png")
class_name Bullet extends StaticBody2D

var bullet_speed: float
var parried: bool
var parry_velocity: Vector2

func _ready() -> void:
	parried = false
	parry_velocity = Vector2(0, 0)
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (!parried):
		tick(delta)
	else:
		position += parry_velocity * bullet_speed

func tick(delta: float) -> void:
	printerr("Bullet is an abstract class. Override 'tick' method.")
