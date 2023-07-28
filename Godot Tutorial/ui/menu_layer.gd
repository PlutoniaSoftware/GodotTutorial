extends CanvasLayer

signal start_game

@onready var start_message = $StartMenu/StartMessage
@onready var score_label = $GameOverMenu/VBoxContainer/ScoreLabel
@onready var high_score_label = $GameOverMenu/VBoxContainer/HighScoreLabel
@onready var game_over_menu = $GameOverMenu

var game_started = false

func _input(event):
	var tween = create_tween()
	if event.is_action_pressed("flap") && !game_started:
		emit_signal("start_game")
		tween.tween_property(start_message, "modulate:a", 0, 0.5)
		game_started = true

func init_game_over_menu(score):
	score_label.text = "SCORE " + str(score)
	game_over_menu.visible = true

func _on_button_pressed():
	get_tree().reload_current_scene()
