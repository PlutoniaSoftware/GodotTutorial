extends RigidBody2D


@onready var animsprite = $AnimatedSprite2D


func _process(delta):
	animsprite.play()

func _physics_process(delta):
	position.x += -200 * delta
	if global_position.x <= -200:
		queue_free()
		
	#if linear_velocity.y < 20:
	#	gravity_scale = 0
	#	position.y = 300
