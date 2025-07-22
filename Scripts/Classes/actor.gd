class_name Actor extends Entity

@export var speed: float = 0
@export var strength: float = 0
@export var cooldown: float = .5
var cooldown_timer: Timer
@export var attack_area: AttackArea
var can_attack: bool = true

func _init() -> void:
	
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	var new_timer: Timer = Timer.new()
	new_timer.wait_time = cooldown
	new_timer.timeout.connect(_cooldown_timer_end)
	cooldown_timer = new_timer
	add_child(new_timer)

func move(direction: Vector2) -> void:

	var movement: Vector2 = direction * speed

	move_and_collide(movement)

func attack(direction: Vector2) -> void:

	if can_attack:

		can_attack = false
		cooldown_timer.start()

		attack_area.rotation = direction.angle()

		# Animation time not implemented yet
		await get_tree().create_timer(0.1).timeout

		attack_area.hit()

func _cooldown_timer_end() -> void: can_attack = true
