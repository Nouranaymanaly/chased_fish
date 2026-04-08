extends Node

var lives = 3

func lose_life():
	lives -= 1
	# This updates the counter on the screen immediately
	update_lives_ui()
	
	if lives <= 0:
		update_message("GAME OVER")
	else:
		print("Lives remaining: ", lives)
	return lives

func update_lives_ui():
	# Find the LivesLabel and update its text
	var lives_label = get_tree().root.find_child("LivesLabel", true, false)
	if lives_label:
		lives_label.text = "Lives: " + str(lives)

		
func update_message(text: String):
	var label = get_tree().root.find_child("StatusLabel", true, false)
	if label:
		label.text = text
		# Wait 3 seconds then go back to the menu
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://ui.tscn")
