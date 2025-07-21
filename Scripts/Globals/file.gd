extends Node

const default_path = "user://game_state.save"
const default_password = "123abc456def"

func save(content: Dictionary, path: String = default_path) -> void:
    var file = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, default_password)
    if file:
        file.store_var(content)
        file.close()
    else:
        print("Failed to open file for writing.")

func load(path: String = default_path) -> Dictionary:
    var file = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, default_password)
    if file:
        var content = file.get_var()
        file.close()
        return content
    else:
        print("Failed to open file for reading.")
        return {}

func delete(path: String = default_path) -> void:
    var file = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, default_password)
    if file:
        file.store_var(null)
        file.close()
    else:
        print("Failed to open file for deleting.")