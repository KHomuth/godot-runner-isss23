extends CharacterBody2D

const JUMP_VELOCITY = -600.0

signal hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 980.0
var double_jump = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif !double_jump:
			velocity.y = JUMP_VELOCITY
			double_jump = true

	if is_on_floor():
		double_jump = false


	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("obstical"):
			get_tree().reload_current_scene()
