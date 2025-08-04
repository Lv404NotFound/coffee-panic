# coffee-panic

📄 Changelog technique détaillé (README complémentaire)
main.gd
But : Contrôler la caméra, effectuer un zoom vers un objet, puis revenir à la position d’origine.

✅ zoom_to(p_target: Node3D) : tween pour déplacer la caméra vers un objet ciblé.

✅ zoom_back() : tween pour revenir à la position de départ.

✅ Sauvegarde de la position et du regard d’origine dans _ready()

CoffeeController.gd
But : Gérer les étapes de la préparation du café et guider le joueur.

✅ steps_data : liste des étapes avec ID et texte (balance, bouilloire, etc.)

✅ update_instruction() : déclenche le zoom vers l’objet lié à l’étape

✅ build_step_list() : met à jour l’interface texte (StepLabel)

✅ handle_click(object_name) : vérifie que le joueur suit bien l’ordre des étapes

✅ Ajout de await get_tree().process_frame pour éviter les erreurs de chargement trop tôt

Scale.gd
But : Réagir au clic du joueur sur la balance

✅ _input_event(...) : appelle handle_click("scale") dans CoffeeController

Kettle.gd
But : Réagir au clic du joueur sur la bouilloire

✅ _input_event(...) : appelle handle_click("kettle") dans CoffeeController

CanvasLayer/StepLabel
But : Afficher les instructions à l’écran

✅ Texte mis à jour automatiquement à chaque étape

✅ Symboles visuels (✅, ✍️, ❌) selon progression et erreurs

🧪 Sécurité & Robustesse
✅ Utilisation de get_node_or_null pour éviter les erreurs null

✅ Gestion des erreurs avec printerr() si un nœud est manquant

✅ Centralisation de la logique dans CoffeeController pour faciliter l’ajout de futures étapes
