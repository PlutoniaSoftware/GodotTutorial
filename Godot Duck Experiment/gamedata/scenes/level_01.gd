extends Node2D

var enemy = preload("res://gamedata/body/enemy.tscn")

func _ready():
	randomize()
	
	var duck = enemy.instantiate()
	add_child(duck)
	duck.position.y = randi()%400 + 150
	
