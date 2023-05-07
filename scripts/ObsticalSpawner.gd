extends Node

var texture = preload("res://sprites/icon.svg")
var obsticles = []
var timer = Timer.new()
var speed = 5
	
func _createObsitical():
	var rigidBody2d = RigidBody2D.new()
	
	var sprite2d = Sprite2D.new()
	sprite2d.texture = texture

	var colisionShape2d = CollisionShape2D.new()
	colisionShape2d.debug_color = Color(33,33,33,50)
	var shape = RectangleShape2D.new()
	shape.size = Vector2(100,100)
	
	colisionShape2d.shape = shape

	rigidBody2d.add_child(sprite2d)
	rigidBody2d.add_child(colisionShape2d)
	
	rigidBody2d.position = Vector2(500, 0)
	rigidBody2d.gravity_scale = 0
	rigidBody2d.linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	rigidBody2d.linear_damp = 0
	
	rigidBody2d.lock_rotation = true
	
	rigidBody2d.add_to_group("obstical")
	
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
		obsticles.front().linear_velocity = Vector2(-10000 * speed * delta,0)  
		add_child(obsticles.front())
		
		speed = speed * 1.03
		
		timer.start(randi_range(2,5))
		print(obsticles.size())
	
	if(obsticles.size() > 4):
		obsticles.back().queue_free()
		obsticles.pop_back()
