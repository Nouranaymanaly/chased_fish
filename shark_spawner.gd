extends Node2D

var shark_scene = preload("res://shark.tscn") 

func _ready():
	# Create a timer to spawn sharks every 2 seconds
	var spawn_timer = Timer.new()
	spawn_timer.wait_time = 4.0
	spawn_timer.autostart = true
	add_child(spawn_timer)
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout():
	var new_shark = shark_scene.instantiate()
	
	# Get the goldfish's current X position so sharks spawn ahead of it
	var fish = get_parent().get_node("Goldfish")
	
	# Position the shark about 1200 pixels ahead of the fish
	# And pick a random height (Y) between 50 and 600
	var spawn_x = fish.position.x + 1200
	var spawn_y = randf_range(50, 600)
	
	new_shark.position = Vector2(spawn_x, spawn_y)
	
	# Add the shark to the main scene
	get_parent().add_child(new_shark)
	
