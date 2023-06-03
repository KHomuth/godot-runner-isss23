extends Node

var textureCactus = preload("res://sprites/cactus.png")
var textureBird = preload("res://sprites/bird.png")
var obsticles = []
var timer = Timer.new()
var spawnSpeedBottom = 4
var spawnSpeedTop = 7
var speed = 4
var alreadySpawned = 0
var obsticleLimit = 3
var cScale = Vector2(-350, -200)
var bScale = Vector2(-100, -150)
	
func _createObsitical(texture, scale = Vector2(1,1),shapeScale = Vector2(1,1), flip = false):
	var rigidBody2d = RigidBody2D.new()
	
	var sprite2d = Sprite2D.new()
	sprite2d.texture = texture
	sprite2d.flip_h = flip
	sprite2d.scale = scale

	var colisionShape2d = CollisionShape2D.new()
	colisionShape2d.debug_color = Color(33,33,33,50)
	var shape = RectangleShape2D.new()
	shape.size = texture.get_size() + shapeScale
	print(shape.size)
	
	colisionShape2d.shape = shape
	colisionShape2d.scale = scale

	rigidBody2d.add_child(sprite2d)
	rigidBody2d.add_child(colisionShape2d)
	
	rigidBody2d.gravity_scale = 0
	rigidBody2d.linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	rigidBody2d.linear_damp = 0
	
	rigidBody2d.lock_rotation = true
	
	rigidBody2d.collision_layer = 1
	rigidBody2d.collision_mask = 1
	
	
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
		
		if alreadySpawned >= 5:
			obsticleLimit = 5
		
		var randomObstical = randi_range(0,obsticleLimit)
		
		if randomObstical == 0:
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15),cScale))
			obsticles.front().position = Vector2(1000, 2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 1:
			obsticles.push_front(_createObsitical(textureBird, Vector2(0.2,0.2), bScale,true))
			obsticles.front().position = Vector2(1000, -140)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 2:
			obsticles.push_front(_createObsitical(textureBird, Vector2(0.2,0.2), bScale,true))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 3:
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.23,0.23), cScale))
			obsticles.front().position = Vector2(1000, -30)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 3:
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.23,0.23), cScale))
			obsticles.front().position = Vector2(1000, -30)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 4:
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15), cScale))
			obsticles.front().position = Vector2(1000, -2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15), cScale))
			obsticles.front().position = Vector2(1100, -2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15),cScale))
			obsticles.front().position = Vector2(1200, -2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 5:
			obsticles.push_front(_createObsitical(textureBird, Vector2(0.2,0.2), bScale,true))
			obsticles.front().position = Vector2(1000, -140)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsitical(textureBird, Vector2(0.2,0.2), bScale,true))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 6:
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15), cScale))
			obsticles.front().position = Vector2(1000, -2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsitical(textureBird, Vector2(0.2,0.2), bScale,true))
			obsticles.front().position = Vector2(1100, -140)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsitical(textureCactus, Vector2(0.15,0.15),cScale))
			obsticles.front().position = Vector2(1200, -2)
			obsticles.front().linear_velocity = Vector2((-10000 * delta) * speed ,0) 
			add_child(obsticles.front())
			
		alreadySpawned = alreadySpawned + 1
		
		if alreadySpawned % 5 == 4:
			speed = speed + 0.2
			spawnSpeedBottom = spawnSpeedBottom * 0.95
			spawnSpeedTop = spawnSpeedTop * 0.95
		
		timer.start(randi_range(spawnSpeedBottom,spawnSpeedTop))
	
	if(obsticles.size() > 4):
		obsticles.back().queue_free()
		obsticles.pop_back()
