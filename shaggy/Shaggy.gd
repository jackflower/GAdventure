extends KinematicBody2D

# 2018-11-15 acodemia.pl

const MOTION_SPEED = 120 # Pixels/seconds
var health = 100
var on_scene = false


func _ready():
	set_physics_process(true)
	on_scene = true
	pass
	
func _physics_process(delta):
	
	var motion = Vector2()
	var collision = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * MOTION_SPEED * delta
	motion = move_and_collide(motion)
	
	
	if(health <= 0):
		self.queue_free()	# obiekt ginie...
		
		
	if(motion):
		print("Kolizja...")
		$AnimationPlayer.play("shaggy_walk")
		#$AnimationPlayer.stop()
	else:
		print()
		#$AnimationPlayer.play("shaggy_walk")
		#$AnimationPlayer.stop()
	
	
func update_health(damage):
	health -= damage
	print(health)
	pass
	
	
func update_item( item ):
	print (self.name + ": znalazłem " + item)
	pass
	
	