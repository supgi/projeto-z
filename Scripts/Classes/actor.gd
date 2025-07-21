class_name Actor extends Entity

@export var speed: float = 0
@export var strength: float = 0
@export var attack_area: AttackArea

func _init() -> void: motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func move(direction: Vector2) -> void:

	var movement: Vector2 = direction * speed

	move_and_collide(movement)

func attack(direction: Vector2) -> void: 

	attack_area.rotation = direction.angle()

	# Animation time not implemented yet
	await get_tree().create_timer(0.1).timeout

	attack_area.hit()
