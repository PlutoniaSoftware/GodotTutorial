extends Node2D

@onready var hud = $HUD
@onready var obstacle_spawner = $ObstacleSpawner
@onready var ground = $Ground

var score = 0:
	set = set_score
	
func _ready():
	obstacle_spawner.connect("obstacle_created", _on_obstacle_created)
	new_game()
	
func new_game():
	self.score = 0
	obstacle_spawner.start()

func player_score():
	self.score +=1

func set_score(new_score):
	score = new_score
	hud.update_score(score)

func _on_obstacle_created(obs):
	obs.connect("score", player_score)
	

func _on_dead_zone_body_entered(body):
	if body is Player:
		if body.has_method("die"):
			body.die()

func _on_player_died():
	game_over()
	
func game_over():
	obstacle_spawner.stop()
	ground.get_node("AnimationPlayer").stop()
	get_tree().call_group('obstacles', 'set_physics_process', false)
