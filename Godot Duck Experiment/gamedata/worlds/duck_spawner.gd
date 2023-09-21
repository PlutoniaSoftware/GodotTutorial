extends Node2D

@onready var timer = $Timer
var Duck = preload("res://gamedata/body/enemy.tscn")

func _ready():
	randomize()

func _on_timer_timeout():
	spawn_duck()
	
func spawn_duck():
	print(position)
	var duck = Duck.instantiate()
	add_child(duck)
	#duck.position.x = position.x
	#duck.position.y = position.y
	print(duck.position)
	emit_signal("duck_created", duck)
	
func start():
	timer.start()

func stop():
	timer.stop()
