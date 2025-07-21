extends Control

func _on_play_pressed() -> void:

    # temp change scene
    get_tree().change_scene_to_file("res://Test/test.tscn")

func _on_exit_pressed() -> void:

    get_tree().quit()


