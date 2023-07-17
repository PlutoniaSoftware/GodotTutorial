extends Node2D

signal obstacle_created(obs)

@onready var timer = $Timer

var Obstacle = preload("res://enviroments/obstacle.tscn")

func _ready():
	randomize()

func _on_timer_timeout():
	spawn_obstacle()
	
func spawn_obstacle():
	var obstacle = Obstacle.instantiate()
	add_child(obstacle)
	obstacle.position.y = randi()%400 + 150
	emit_signal("obstacle_created", obstacle)
	
func start():
	timer.start()

func stop():
	timer.stop()
