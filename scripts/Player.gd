extends Area2D


const FIRE_ACTION = "fire"
const ENEMY_GROUP = "enemy"


@export var laser_tscn : PackedScene


func _process(delta):
	# print("This happens every moment of the game.")
	
	var mouse_pos = get_global_mouse_position()
	position.x = mouse_pos.x
	
	# player clicks -> Spawn Laser
	if Input.is_action_just_pressed(FIRE_ACTION):
		var new_laser = laser_tscn.instantiate()
		new_laser.position = position
		add_sibling(new_laser)

func _on_area_entered(area: Area2D):
	if(area.is_in_group(ENEMY_GROUP)):
		GameState.set_game_over(true)
		queue_free()
