extends Node3D

@onready var camera = $Camera3D
var default_position := Vector3()
var default_look_at := Vector3()

func _ready():
	default_position = camera.global_transform.origin
	default_look_at = Vector3.ZERO

func zoom_to(p_target: Node3D) -> void:
	if p_target == null:
		printerr("zoom_to() : p_target est null")
		return

	var tween = create_tween()

	# Position légèrement en retrait et en hauteur par rapport à l’objet
	var target_position = p_target.global_transform.origin + Vector3(0, 2, 3)
	tween.tween_property(camera, "position", target_position, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	# Regarder l’objet
	var target_look = p_target.global_transform.origin
	tween.tween_callback(Callable(camera, "look_at").bind(target_look, Vector3.UP))

func zoom_back() -> void:
	var tween = create_tween()
	tween.tween_property(camera, "position", default_position, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_callback(Callable(camera, "look_at").bind(default_look_at, Vector3.UP))
