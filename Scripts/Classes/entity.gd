class_name Entity extends CharacterBody2D

@export var health: float = 1
@export var sprites: Node2D

@export_group("configuration")
@export var can_die: bool = true
@export var can_hurt: bool = true

func get_damage(value: float) -> void:

	if can_hurt:

		_hurt_effect()
		health -= value
	
	if can_die and health <= 0:

		_die()

func _hurt_effect() -> void:

	var tween:Tween = create_tween()
	tween.set_parallel()

	tween.tween_property(sprites, "modulate", Color.RED, 0.05)
	tween.tween_property(sprites, "modulate", Color.WHITE, 0.05).set_delay(0.25)

func _die() -> void: queue_free()
