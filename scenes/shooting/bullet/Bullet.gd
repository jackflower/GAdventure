extends KinematicBody2D

# Scinfor - jackflower
# April 26, 2018
#
# The scene represents a simple animated projectile


var bullet_speed = 200 # Pixels/seconds
var bullet_direction = Vector2(0, 0)
var caliber = 1
var bullet_name = "Pocisk"

func _ready():
	set_physics_process(true)
	pass
	
	
func _physics_process(delta):
	
	var motion = Vector2()
	motion += Vector2(bullet_direction)
	
	motion = motion.normalized() * bullet_speed * delta
	motion = move_and_collide(motion)
	
	if(motion):
		# check with what object the missile interferes
		var entity = motion.collider
		# the name of the object from which the bullet collided
		var napis = "Bullet collides with: "
		print (napis + entity.get_name())
		# health update of the hit object
		if(entity.has_method("update_health")):
			entity.update_health(int(caliber))
			pass
		explode()
		queue_free()
	pass
	
	
func explode():
	var explosion = preload("../explosion/Explosion.tscn").instance()
	explosion.global_position = global_position
	explosion.global_scale = self.global_scale
	explosion.get_node("AnimatedSprite").get_sprite_frames().set_animation_speed(explosion.get_node("AnimatedSprite").get_animation(), bullet_speed)
	get_parent().add_child(explosion)
	pass
	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass
