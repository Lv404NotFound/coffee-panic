extends Node3D

func _input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_node("/root/Main/CoffeeController").handle_click("kettle")
