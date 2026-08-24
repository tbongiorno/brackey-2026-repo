class_name MainGame
extends Node


# FUTURE (main menu): Lad test level for prototype
const TEST_LEVEL : String = "uid://dfb8pxvitdyq8"
const PLAYER : String = "example"

var player = null

var _current_level = null

#Game World Root Nodes
@onready var level_root = %LevelRoot
@onready var entity_root = %EntityRoot
@onready var effect_root = %EffectRoot


# UI Root Nodes
@onready var hud_root = %HudLayer
@onready var transition_root = %TransitionLayer
@onready var debug_root = %DebugLayer

func _ready() -> void:
	load_level(TEST_LEVEL)


## Called for loading a level scene.
## NOTE: The input level_scene must extend BaseLevel
func load_level(level_scene : String) -> void:
	# Make sure this is called during idle time
	_deferred_load_level.call_deferred(level_scene)

func _deferred_load_level(level_scene_uid : String) -> void:
	if _current_level != null:
		_current_level.queue_free()
		_current_level = null

	# Allow the old level to finish freeing before adding the new one
	await get_tree().process_frame

	var new_level_packed : PackedScene =\
		ResourceLoader.load(level_scene_uid, "PackedScene") as PackedScene
	if new_level_packed == null:
		push_error("Could not load level as a packed scene: " + level_scene_uid)
		return

	_current_level = new_level_packed.instantiate() as BaseLevel
	if _current_level == null:
		push_error("Loaded level is not of type Level or does not exist")
		return
		# FUTURE (main menu): Should have a fall back scene

	level_root.add_child(_current_level)

	# Allow level to fully process before accessing it
	await get_tree().process_frame
