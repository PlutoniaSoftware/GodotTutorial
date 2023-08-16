extends RigidBody2D


func _physics_process(delta):
	position.x += -200 * delta
	if global_position.x <= -200:
		queue_free()
