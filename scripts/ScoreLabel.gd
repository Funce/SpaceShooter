extends Label


func _ready():
	GameState.score_updated.connect(_on_game_state_score_updated)

func _on_game_state_score_updated(new_score):
	text = "Score: " + str(new_score)
