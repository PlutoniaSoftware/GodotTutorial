extends Node2D

var enemy = preload("res://gamedata/body/enemy.tscn")
var gravity_scale = ProjectSettings.get("physics/2d/default_gravity")

@onready var input_gravity = $DebugOptions/GravityScale/Gravity
@onready var input_gravity_label = $DebugOptions/GravityScale

func prepare_debug():
	input_gravity.text = str(gravity_scale)
	input_gravity_label.text = "Gravity Scale = " + str(input_gravity.text)
	
func modify_parameters():
	#var duck = get_tree().get_node("")
	#print(duck)
	pass
	
func _process(delta):
	modify_parameters()

func _ready():
	prepare_debug()
	randomize()
		
	var duck = enemy.instantiate()
	print(duck)
	add_child(duck)
	# duck.position.y = randi()%400 + 150
	
func _on_change_gravity(new_text):
	ProjectSettings.set_setting("physics/2d/default_gravity", int(input_gravity.text))
	input_gravity_label.text = "Gravity Scale = " + str(input_gravity.text)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://gamedata/scenes/start_menu.tscn")

func _on_reset_level_pressed():
	get_tree().reload_current_scene()
