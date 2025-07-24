class_name AttackArea extends Area2D

var targets: Dictionary
var parent: Actor

func _ready() -> void:

	parent = get_parent()
	collision_layer = 0
	collision_mask = parent.collision_mask
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func hit() -> void: 

	for target in targets:

		targets[target].get_damage(parent.strength)

func _on_body_entered(body: Node2D) -> void:

	if body is Actor: targets[body.name] = body

func _on_body_exited(body: Node2D) -> void: targets.erase(body.name)
