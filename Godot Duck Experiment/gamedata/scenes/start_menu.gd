extends Node2D

var level01 = preload("res://gamedata/scenes/level_01.tscn").instantiate()
var menu = preload("res://gamedata/scenes/start_menu.tscn").instantiate()

func _ready():
	get_tree().get_root().add_child(menu)

func _on_btn_exit_pressed():
	get_tree().quit()

func _on_btn_level_01_pressed():
	# menu.free()
	get_tree().get_root().add_child(level01)
	
