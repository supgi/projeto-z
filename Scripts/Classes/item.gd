class_name Item extends Area2D

@export var item: StringName
@export_group("Poperty")
@export_flags("Material", "Weapon") var types

func _init() -> void:

    body_entered.connect(_on_body_entered)
    collision_layer = 4
    collision_mask = 1

func _on_body_entered(body: Node2D) -> void:

    body.get_item(self)
    
func action(player: Player) -> void: pass