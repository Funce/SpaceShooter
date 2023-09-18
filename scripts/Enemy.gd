extends Area2D

@export var MOVEMENT_SPEED : float = 200
@export var SCORE_VALUE: float = 10

const LASER_GROUP = "laser"

signal enemy_destroyed(score_value: float)

var viewport_height

func _ready():
	viewport_height = get_viewport_rect().size.y
	

func _process(delta):
	position.y += MOVEMENT_SPEED * delta
	
	if (position.y > viewport_height + 20):
		queue_free()


func _on_area_entered(area):
	queue_free() # You should destroy yourself, NOW
	
	# Ding dong the witch is gone
	if(area.is_in_group(LASER_GROUP)):
		GameState.add_score(SCORE_VALUE)
	# enemy_destroyed.emit(SCORE_VALUE)
