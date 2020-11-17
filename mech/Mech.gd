extends KinematicBody2D

# 2019-01-19 acodemia.pl

export (int) var mech_speed = 100

var target = Vector2()
var velocity = Vector2()
var direction = Vector2()
var health: float = 100
var shooting: bool = false
var bullet_data = preload("bullet/Bullet.tscn")
var fireball_data = preload("bullet/Fireball.tscn")
var current_bullet_data = bullet_data

var on_scene = false

export (float) var created_bullet_scale_factor = 1
export (float) var created_bullet_speed = 200
export (float) var bullet_caliber = 2


func _ready():
	target = self.global_position
	target.x = target.x + 0.0001 # unikamy wektora zerowego
	on_scene = true
	set_physics_process(true)
	pass
	
	
func _input(event):
	if event.is_action_pressed('Left_click'):
		target = get_global_mouse_position()
		$mech_members/AnimationPlayer.play("animation_mech_walk")
	if event.is_action_pressed('Right_click'):
		if(shooting):
			Shot()
	if event.is_action_pressed('Bullet'):
		current_bullet_data = bullet_data
	if event.is_action_pressed('Fireball'):
		current_bullet_data = fireball_data
	pass
	
	
func _physics_process(delta):
	
	#velocity = (target - position).normalized() * mech_speed * delta # two
	velocity = (target - position).normalized() * mech_speed
	rotation = velocity.angle()

	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)
		$mech_members/AnimationPlayer.play("animation_mech_walk")
	else:
		$mech_members/AnimationPlayer.stop()
	pass
	
	
	if(health <= 0):
		self.queue_free()
	pass
	
	
func update_health(damage):
	health -= damage
	print("Health: " + String(health))
	pass
	
	
func _on_TimerShoot_timeout():
	shooting = true
	pass
	
	
func Shot():
	
	var bullet_left = current_bullet_data.instance()
	var bullet_right = current_bullet_data.instance()
	direction = velocity.normalized()
	
	bullet_left.bullet_direction = direction
	bullet_right.bullet_direction = direction
	
	bullet_left.global_scale = global_scale * created_bullet_scale_factor
	bullet_right.global_scale = global_scale * created_bullet_scale_factor
	
	bullet_left.global_position  = $mech_members/mech_arm_left/cannon_left.global_position
	bullet_right.global_position  = $mech_members/mech_arm_right/cannon_right.global_position
	
	bullet_left.global_rotation_degrees = $mech_members/mech_arm_left/cannon_left.global_rotation_degrees
	bullet_right.global_rotation_degrees = $mech_members/mech_arm_right/cannon_right.global_rotation_degrees
	
	bullet_left.bullet_speed = created_bullet_speed
	bullet_right.bullet_speed = created_bullet_speed
	
	bullet_left.caliber = bullet_caliber
	bullet_right.caliber = bullet_caliber
	
	get_parent().add_child(bullet_left)
	get_parent().add_child(bullet_right)
	
	pass
	
