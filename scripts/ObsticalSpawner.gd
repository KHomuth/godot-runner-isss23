extends Node

#var textureCactus = preload("res://sprites/cactus.png")
#var textureBird = preload("res://sprites/bird.png")

var animationWolf = preload("res://animations/WolfRun.tres")
var animationBat = preload("res://animations/BatFly.tres")
var animationBear = preload("res://animations/BearRun.tres")

var obsticles = []
var timer = Timer.new()
var spawnSpeedBottom = 4
var spawnSpeedTop = 6
var speed = 4
var alreadySpawned = 0
var obsticleLimitTop = 3
var obsticleLimitBottom = 0
# var cScale = Vector2(-350, -200)
var wolfScale = Vector2(-19, 0)
var batScale = Vector2(0, 0)
var bearScale = Vector2(0,0)
# var bScale = Vector2(-200, -150)

func _createObsitical(texture, scale = Vector2(1,1),shapeScale = Vector2(1,1), flip = false):
	var rigidBody2d = RigidBody2D.new()

	var sprite2d = Sprite2D.new()
	
	sprite2d.texture = texture
	sprite2d.flip_h = flip
	sprite2d.scale = scale
	
	var colisionShape2d = CollisionShape2D.new()
	colisionShape2d.debug_color = Color(33,33,33,50)
	
	# var shape = RectangleShape2D.new()
	var shape = CapsuleShape2D.new()
	
	#shape.size = texture.get_size() + shapeScale
	shape.height = texture.get_size().y + shapeScale.y
	
	shape.radius = 200
	
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

func _createObsiticalAnim(animation, scale = Vector2(1,1),shapeScale = Vector2(1,1)):
	var rigidBody2d = RigidBody2D.new()
	var animatedSprite2d = AnimatedSprite2D.new()
	
	animatedSprite2d.sprite_frames = animation
	
	animatedSprite2d.scale = scale
	
	var colisionShape2d = CollisionShape2D.new()
	colisionShape2d.debug_color = Color(100,0,0,50)
	
	# var shape = RectangleShape2D.new()
	var shape = CapsuleShape2D.new()
	#shape.size = animation.get_frame_texture("default", 0).get_size().x + shapeScale.x
	
	shape.height = animation.get_frame_texture("default", 0).get_size().x + shapeScale.x
	shape.radius = 10
	
	colisionShape2d.shape = shape
	colisionShape2d.scale = scale
	
	colisionShape2d.rotate(PI/2)

	rigidBody2d.add_child(animatedSprite2d)
	rigidBody2d.add_child(colisionShape2d)
	animatedSprite2d.play()
	
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
		if alreadySpawned >= 24 :
			obsticleLimitTop = 12
			obsticleLimitBottom = 4
			
		elif alreadySpawned >= 16 :
			obsticleLimitTop = 9
			
		elif alreadySpawned >= 8:
			obsticleLimitTop = 6
		
		#var randomObstical = randi_range(12,12)
		var randomObstical = randi_range(obsticleLimitBottom,obsticleLimitTop)
		
		if randomObstical == 0:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 1:
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 2:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 3:
			obsticles.push_front(_createObsiticalAnim(animationBear, Vector2(4,4),bearScale))
			obsticles.front().position = Vector2(1000, 0)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			
		elif randomObstical == 4:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1150, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1300, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 5:
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -150)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 6:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1100, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1200, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 7:
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1150, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1300, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 8:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBear, Vector2(4,4),bearScale))
			obsticles.front().position = Vector2(1200, 0)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 9:
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1200, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBear, Vector2(4,4),bearScale))
			obsticles.front().position = Vector2(1400, 0)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
		elif randomObstical == 10:
			obsticles.push_front(_createObsiticalAnim(animationBear, Vector2(4,4),bearScale))
			obsticles.front().position = Vector2(1000, 0)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 11:
			obsticles.push_front(_createObsiticalAnim(animationBear, Vector2(4,4),bearScale))
			obsticles.front().position = Vector2(1150, 0)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1000, -300)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1300, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
		
		elif randomObstical == 12:
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1000, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1150, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationWolf, Vector2(2.5,2.5),wolfScale))
			obsticles.front().position = Vector2(1300, 15)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1080, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
			
			obsticles.push_front(_createObsiticalAnim(animationBat, Vector2(2.5,2.5),batScale))
			obsticles.front().position = Vector2(1220, -140)
			obsticles.front().linear_velocity = Vector2((-160) * speed ,0) 
			add_child(obsticles.front())
				
		alreadySpawned = alreadySpawned + 1
		
		if alreadySpawned % 5 == 4:
			speed = speed + 0.2
			spawnSpeedBottom = spawnSpeedBottom * 0.90
			spawnSpeedTop = spawnSpeedTop * 0.985
			
		if spawnSpeedTop < 3:
			spawnSpeedTop = 3
			
		if spawnSpeedBottom < 2:
			spawnSpeedBottom = 2
		
		timer.start(randi_range(spawnSpeedBottom,spawnSpeedTop))
	
	if(obsticles.size() > 8):
		obsticles.back().queue_free()
		obsticles.pop_back()


func _on_character_body_2d_hit():
	obsticles.clear()
