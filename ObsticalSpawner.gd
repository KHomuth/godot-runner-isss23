extends Node

var texture = preload("res://icon.svg")
var obsticles = []
var timer = Timer.new()

func _createObsitical():
	var rigidBody2d = RigidBody2D.new()
	
	var sprite2d = Sprite2D.new()
	sprite2d.texture = texture

	var colisionShape2d = CollisionShape2D.new()
	colisionShape2d.debug_color = Color(33,33,33,50)
	var shape = CapsuleShape2D.new()
	
	shape.height = 30
	shape.radius = 10
	
	colisionShape2d.shape = shape
	
	rigidBody2d.add_child(colisionShape2d)
	rigidBody2d.add_child(sprite2d)
	
	rigidBody2d.position = Vector2(500, 0)
	rigidBody2d.gravity_scale = 0
	rigidBody2d.linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	rigidBody2d.linear_damp = 0
	rigidBody2d.lock_rotation = true
	rigidBody2d
	return rigidBody2d

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.one_shot = true	
	timer.start(3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(timer.is_stopped()):
		
		obsticles.push_front(_createObsitical())
		obsticles.front().linear_velocity = Vector2(-10000 * delta,0)  
		add_child(obsticles.front())
		timer.start(3)
		print(obsticles.size())
		
	if(obsticles.size() > 4):
		obsticles.back().queue_free()
		obsticles.pop_back()
