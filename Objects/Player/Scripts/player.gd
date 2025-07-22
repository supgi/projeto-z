class_name Player extends Actor

@export var level_curve: Curve
var level: int = 0
var experience: float = 0

var looking_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:

    var dir: Vector2 = Input.get_vector("left", "right", "up", "down")

    move(dir)

func _input(event: InputEvent) -> void:

    if event.is_action_pressed("attack"):

        var attack_direction: Vector2 = global_position.direction_to(get_global_mouse_position())
        attack(attack_direction)

func get_xp(xp: float) -> void:

    experience += xp
    if experience > level_curve.sample_baked(level):

        level += 1