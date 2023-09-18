extends Node2D

@export var enemy_tscn : PackedScene

signal new_enemy_created(enemy)

# every second -> Spawn new enemy
func spawn_enemy_ship():
	var new_enemy = enemy_tscn.instantiate()
	
	
	var viewport_width = get_viewport_rect().size.x
	
	# Get the clearance from either side so the ships don't clip off the edge.
	var border_width = 30
	
	var rand_x = randf_range(border_width, viewport_width - border_width)
	new_enemy.position.x = rand_x
	new_enemy.position.y = -50 #above top of screen
	
	add_child(new_enemy)
	new_enemy_created.emit(new_enemy)
