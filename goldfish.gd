extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		
