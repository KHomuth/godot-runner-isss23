extends CharacterBody2D

signal hit

const JUMP_VELOCITY = -600.0

var gravity = 980.0
var double_jump = false
var health = 100

@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	_animated_sprite.play("run")

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
		if collision.get_collider().is_in_group("obstical") and health > 50:
			collision.get_collider().queue_free()
			health -= 50
			hit.emit()
		elif collision.get_collider().is_in_group("obstical") and health <= 50:
			get_tree().reload_current_scene()
			
