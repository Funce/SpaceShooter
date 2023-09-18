extends Node

var score = 0
signal score_updated(new_score)

var game_over = false
signal game_over_updated(new_game_over_state: bool)

func set_game_over(new_game_over_state: bool):
	game_over = new_game_over_state
	game_over_updated.emit(game_over)

func add_score(added_score):
	score += added_score
	score_updated.emit(score)
