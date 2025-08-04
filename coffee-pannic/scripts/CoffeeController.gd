extends Node

@onready var main = get_node("/root/Main")
@onready var label = get_node("../CanvasLayer/StepLabel")

var step = 0
var steps_data = [
	{"id": "scale", "text": "✍️ Pèse 12.5g de café moulu"},
	{"id": "kettle", "text": "💧 Fais chauffer l'eau à 90°C"}
]

func _ready():
	await get_tree().process_frame  # Assure que tous les nœuds soient chargés
	update_instruction()

func handle_click(object_name: String):
	var expected = steps_data[step].id if step < steps_data.size() else ""
	if object_name == expected:
		step += 1
		update_instruction()
	else:
		print("❌ Mauvaise étape. Clique d'abord sur :", expected)
		label.text = build_step_list(expected)

func update_instruction():
	if step < steps_data.size():
		var current = steps_data[step].id
		match current:
			"scale":
				main.zoom_to(main.get_node("Scale"))
			"kettle":
				main.zoom_to(main.get_node("Kettle"))
		label.text = build_step_list()
	else:
		label.text = "✅ Toutes les étapes sont terminées ! 🏁"
		main.zoom_back()

func build_step_list(error: String = "") -> String:
	var text = ""
	for i in steps_data.size():
		var entry = steps_data[i]
		var symbol = "✅" if i < step else "✍️"
		if entry.id == error:
			symbol = "❌"
		text += symbol + " " + entry.text + "\n"
	return text.strip_edges()
