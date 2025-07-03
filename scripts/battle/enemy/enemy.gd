class_name Enemy extends Node2D

# -- Variables
var dmg: int

var mini_sprite: Texture
var mini_sprite_hit: Texture

var purify_meter: int

# -- Functions

# Class initialization. Set default stats here
func _init(p_dmg: int, p_mini_sprite: Texture, p_mini_sprite_hit: Texture) -> void:
	dmg = p_dmg
	mini_sprite = p_mini_sprite
	mini_sprite_hit = p_mini_sprite_hit

# When node is added to scene
func _ready() -> void:
	purify_meter = 0

# Chooses a random attack from list and performs it
func do_attack() -> void:
	pass

# When hit by a parried bullet in combat
func hit() -> void:
	purify_meter += 10
