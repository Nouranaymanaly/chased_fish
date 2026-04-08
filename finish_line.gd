extends Area2D

func _ready() -> void:
	# Connect the signal so it can 'see' the fish
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	# Check if the parent of the area hitting us is the Goldfish
	if area.get_parent().name == "Goldfish":
		GameManager.update_message("YOU WIN!")
		# Disable fish movement
		area.get_parent().set_process(false)
