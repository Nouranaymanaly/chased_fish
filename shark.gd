extends Sprite2D
var fish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish = get_node("../Goldfish") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#
	#if fish.position.x > position.x:
		#translate(Vector2(2,0))
		#set_scale(Vector2(-0.3, 0.3))
	#if fish.position.x < position.x:
		#translate (Vector2(-2,0))
		#set_scale(Vector2(0.3, 0.3))
	#if fish.position. y > position.y:
		#translate (Vector2(0,1))
	#if fish.position.y < position.y:
		#translate(Vector2(0,-1))
func _process(delta: float) -> void:
	if fish.position.x > position.x:
		translate(Vector2(2,0))
		set_scale(Vector2(-0.3, 0.3))
	if fish.position.x < position.x:
		translate(Vector2(-2,0))
		set_scale(Vector2(0.3, 0.3))
	if fish.position.y > position.y:
		translate(Vector2(0,1))
	if fish.position.y < position.y:
		translate(Vector2(0,-1))
