extends Area2D

@export var PROJECTILE_SPEED : float = 100

const ENEMY_GROUP = "enemy"

func _process(delta):
	position.y -= PROJECTILE_SPEED * delta # negatives go upwards
	
	if position.y < -20:
		queue_free()


func _on_area_entered(area: Area2D):
	# if it hits an enemy
	if area.is_in_group(ENEMY_GROUP):
		queue_free()
