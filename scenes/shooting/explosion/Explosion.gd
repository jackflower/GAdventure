extends Area2D

# Scinfor - jackflower
# April 25, 2018
#
# The scene represents a simple explosion

func _ready():
	$AnimatedSprite.play("explosion_animation")
	pass
	
	
func _on_AnimatedSprite_animation_finished():
	self.queue_free()
	pass
