class_name Enemy extends Actor

@export var agressive: bool
@export var aways_follow: bool
@export var detection_area: Area2D

var player: Player

@export var state: STATES = STATES.IDLE
enum STATES{IDLE, FOLLOWING, ATTACKING, PATROLLING}
var state_action: Array = [_idle, _following, _attacking]

func _ready() -> void:
	
	player = get_tree().get_first_node_in_group("Player")
	detection_area.body_entered.connect(_on_body_entered)
	detection_area.body_exited.connect(_on_body_exited)
	detection_area.collision_mask = 1

func _physics_process(delta: float) -> void: state_action[state].call()

func _die() -> void:

	_drop()
	player.get_xp(5)
	queue_free()

func _idle() -> void: move(Vector2.ZERO)

func _following() -> void:

	if player:

		var direction: Vector2 = global_position.direction_to(player.global_position)
		move(direction)
		if global_position.distance_to(player.global_position) < 70: state = STATES.ATTACKING

func _attacking() -> void:

	if player and agressive:

		var direction: Vector2 = global_position.direction_to(player.global_position)
		attack(direction)

		if global_position.distance_to(player.global_position) > 70: state = STATES.FOLLOWING

func _on_body_entered(body: Node2D) -> void:

	if agressive:

		state = STATES.FOLLOWING

func _on_body_exited(body: Node2D) -> void: 

	if not aways_follow:

		state = STATES.IDLE
