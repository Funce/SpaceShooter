extends Label

func _ready():
	GameState.game_over_updated.connect(_on_game_state_game_over_updated)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and GameState.game_over:
		# Reset the scores
		GameState.score = 0
		GameState.game_over = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://startscreen.tscn")

func _on_game_state_game_over_updated(is_game_over: bool):
	visible = is_game_over
