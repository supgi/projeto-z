class_name Entity extends CharacterBody2D

@export var health: float = 1
var max_health: float = health
@export var sprites: Node2D
@export var drop: PackedScene
@export_range(0.0, 10.0, 1.0) var quantity

@export_group("configuration")
@export var can_die: bool = true
@export var can_hurt: bool = true

signal is_dead

func get_damage(value: float) -> void:

	if can_hurt:

		_hurt_effect()
		health -= value
	
	if can_die and health <= 0:

		is_dead.emit()
		_die()

func heal(value: float) -> void:

	health += value
	if health > max_health: health = max_health

func _hurt_effect() -> void:

	var tween:Tween = create_tween()
	tween.set_parallel()

	tween.tween_property(sprites, "modulate", Color.RED, 0.05)
	tween.tween_property(sprites, "modulate", Color.WHITE, 0.05).set_delay(0.25)

func _drop() -> void:

	if drop:

		var drop_instace := drop.instantiate()
		drop_instace.global_position = global_position
		get_parent().add_child(drop_instace)

func _die() -> void:
	
	_drop()
	queue_free()
