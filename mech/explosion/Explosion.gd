extends Area2D

# 2019-01-05 acodemia.pl

func _ready():
	$AnimatedSprite.play("explosion_animation")
	pass
	
	
func _on_AnimatedSprite_animation_finished():
	self.queue_free()
	pass
	
