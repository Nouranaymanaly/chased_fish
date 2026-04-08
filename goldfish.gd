extends Sprite2D
# Added 'can_be_hit' check so you don't lose all lives in one second
var can_be_hit = true
@onready var blink_timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(blink_timer)
	# This line is the "bridge" between the physics and the code
	$Area2D.area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	if Input.is_action_pressed("up") and position.y>=45:
		translate(Vector2(0,-5))
	if Input.is_action_pressed("down") and position.y<=600:
		translate(Vector2(0,5))
	if Input.is_action_pressed("left") and position.x>=100 :
		translate(Vector2(-5,0))
		set_scale(Vector2(-0.2, 0.2))
	if Input.is_action_pressed("right") and position.x<=3400:
		translate(Vector2(5,0))
		set_scale(Vector2(0.2, 0.2))

func respawn():
	# Disappear immediately
	self.visible = false
	can_be_hit = false # Prevent getting hit while respawning
	
	# Move to start position
	position = Vector2(70, 390) 
	
	# Wait half a second while invisible
	await get_tree().create_timer(0.5).timeout
	
	# Flickering effect (6 flashes)
	for i in 6:
		self.visible = not self.visible
		await get_tree().create_timer(0.2).timeout
	
	# Ensure it's visible and can be hit again
	self.visible = true
	can_be_hit = true

func _on_area_entered(area):
	if (area.is_in_group("sharks") or area.get_parent().is_in_group("sharks")) and can_be_hit:
		var remaining = GameManager.lose_life()
		if remaining > 0:
			respawn()
		else:
			# Final death logic
			set_process(false) 
			self.visible = false 
			$Area2D.set_deferred("monitoring", false)
			print("Game Over!")
			
