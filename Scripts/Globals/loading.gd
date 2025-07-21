extends Node

var scene_path: String
var progress: Array[float]

signal _scene_loaded()
signal _progress()

func _ready() -> void:
   set_process(false) 

func _process(delta: float) -> void:

    match ResourceLoader.load_threaded_get_status(scene_path, progress):

        ResourceLoader.THREAD_LOAD_IN_PROGRESS:
            print("progress", progress)

        ResourceLoader.THREAD_LOAD_FAILED:
            print("Scene failed to load.")

        ResourceLoader.THREAD_LOAD_LOADED:
            _scene_loaded.emit()
            set_process(false)
        _:
            print("Nothing to load.")

func init(set_scene_path: String) -> void:

    scene_path = set_scene_path
    ResourceLoader.load_threaded_request(set_scene_path)
    set_process(true)

    