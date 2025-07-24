class_name InteractArea extends Area2D

@export var atractive_force: float = 5 

var closer_interactive: Interactive = null
var items: Array[Item]

func _ready() -> void:

	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

	collision_layer = 0
	collision_mask = 36

func _physics_process(delta: float) -> void:

	if items:

		for item in items:

			var direction: Vector2 = item.global_position.direction_to(self.global_position)
			item.global_position += (direction * atractive_force)

func get_interactive() -> Interactive:

	if closer_interactive: return closer_interactive
	return null

func _on_area_entered(area: Area2D) -> void: if area is Item: items.append(area)

func _on_area_exited(area: Area2D) -> void: items.erase(area)

func _on_body_entered(body: Node2D) -> void:
	
	if body is Interactive:

		closer_interactive = body
		body.set_interactive()

func _on_body_exited(body: Node2D) -> void:

	if body == closer_interactive: 
		
		closer_interactive.set_interactive(false)
		closer_interactive = null
