class_name Interactive extends Entity

var outline_shader: Object = preload("res://Assets/Shaders/outline.gdshader")

func _ready() -> void: sprites.material = ShaderMaterial.new() 

func set_interactive(condition: bool = true) -> void:

    sprites.material.shader = outline_shader if condition else null

func action(player: Player) -> void:

    # exemplo temporario
    if player.inventory.have_item("Rock", 3):
        
        print("Fez a espada lendaria")
        player.inventory.remove_item("Rock", 3)

    else: print("Você precisa de 3 pedras")