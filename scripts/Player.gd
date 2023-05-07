extends Node2D

@onready var ray = $RayCast2D

var grounded = false

var gravity = 15

var max_y_vel = 300
var y_vel = 0


func _physics_process(delta):
	if not grounded:
		y_vel = min(max_y_vel, y_vel+gravity)
	else:
		y_vel = 0
	grounded = false
	
	position.y += y_vel * delta
	
	if ray.is_colliding():
		var orig = ray.global_transform.origin
		var coll = ray.get_collision_point()
		var dist = abs(orig.y - coll.y)
		#var depth = abs(ray.cast_to.y - dist)
		
		grounded = true
		
		position.y -= depth
