extends StaticBody3D

var is_preparing := false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not is_preparing:
			is_preparing = true
			print("☕ Préparation du café...")
			$Label3D.text = "Café en cours..."
			await get_tree().create_timer(3).timeout
			print("✅ Café prêt !")
			$Label3D.text = "Cliquez pour préparer un autre café"
			is_preparing = false
