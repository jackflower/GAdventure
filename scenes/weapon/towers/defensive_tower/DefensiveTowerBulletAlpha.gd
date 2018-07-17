extends Node2D

# Scinfor - jackflower
# July 17, 2018
#
# The scene represents a missile dedicated
# to a given type of defense tower


var bullet_speed = 200 # Pixels/seconds
var bullet_direction = Vector2(0, 0)
var caliber = 1

func _ready():
	set_physics_process(true)
	pass

#func _process(delta):
#	pass
