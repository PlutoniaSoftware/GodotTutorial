extends Node2D

@onready var hud = $HUD
@onready var obstacle_spawner = $ObstacleSpawner
@onready var ground = $Ground
@onready var menu_layer = $MenuLayer

const SAVE_FILE_PATH = "user://savedata.save"

var score = 0:
	set = set_score

var highscore = 0
	
func _ready():
	obstacle_spawner.connect("obstacle_created", _on_obstacle_created)
	load_highscore()
	
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
	
	if score > highscore:
		highscore = score
		save_highscore()
		
	menu_layer.init_game_over_menu(score, highscore)

func _on_menu_layer_start_game():
	new_game()
	
func save_highscore():
	var save_data = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	save_data.store_var(highscore)
	save_data.close()
	
	
func load_highscore():
	if FileAccess.file_exists(SAVE_FILE_PATH):
		var save_data = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
		highscore = save_data.get_var()
		save_data.close()
