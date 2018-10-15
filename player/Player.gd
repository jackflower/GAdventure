extends KinematicBody2D

# 2017-11-25 acodemia.pl

const MOTION_SPEED = 160 # Pixels/seconds
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
	
	collision = motion
	
	if(health <= 0):
		self.queue_free()	# obiekt ginie...
		
	#if(motion):
	#	print("Kolizja...")
	#print(".............")
	#if(collision):w
	#	print("hola hola...")
	#motion.collider.has_method("nazwa")
		
	#if(move_and_collide(motion)):
	#	print("Hola hola..")
#	if(is_colliding()):
#		set_rotd(90)
#		get_node("AnimatedSprite").stop()
#		pass
#	else:
#		set_rotd(0)
#		get_node("AnimatedSprite").play("worm_default_animation")
#		pass
#	pass
	
	
func _on_VisibilityNotifier2D_enter_screen():
	on_scene = true
	pass
	
	
func _on_VisibilityNotifier2D_exit_screen():
	on_scene = false
	pass
	
	
func update_health(damage):
	health -= damage
	print(health)
	pass
	
func update_item():
	print ("Znaleziony")
	pass
