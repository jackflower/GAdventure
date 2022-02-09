extends Node2D

# Scinfor - jackflower
# July 16, 2018
#
# The scene represents an automatic defensive tower


# For the scene to work properly, specify the object
# that will be the target by calling
# the  setTarget (Target)  function.

export(float, 100) var health = 100

var can_shoot_animation = true
var prev_shooting = false
var shooting = false
var my_target
var target_reference
var tower_process_enabled = false # status of processing the update process

var tower_rotation = 0
var distance_to_target = 0
var target_position = Vector2(0, 0)
var bullet_vector = Vector2(0, 0)
var bullet_data = preload("DefensiveTowerBulletAlpha.tscn")

# Inspector - modification:
#	- rate of fire - number of shots per unit of time
#	- projectile speed
#	- scale of the projectile
#	- single fire / continuous fire
#	- caliber transferred to the projectile
#	- the range of the shot from the tower
export (float, 0.125, 10) var  shot_speed = 1
export (float) var created_bullet_speed = 200
export (float) var created_bullet_scale_factor = 0.5
export (bool) var shooting_series = true
export (float) var bullet_caliber = 2
export (float) var tower_shot_range = 200


signal tower_alpha_shoot

func _ready():
	set_physics_process(true)
	#set_process(true)
	
	# january 28, 2022
	$Base/TowerBaseAlpha.health = health
	
	#
	# february 15, 2021
	#  - signal
	#
	# można z tego poziomu podłaczyć sygnał...
	#self.connect("tower_alpha_shoot",get_node("../WaterPump"),"_on_DefensiveTowerAlpha_tower_alpha_shoot")	
	# january 20, 2022
	# description:
	# Podłączamy sygnał "tower_alpha_shoot" zdefiniowany w tym obiekcie { DefensiveTowerAlpha }
	# do obiektu/węzła { WaterPump }, ze wskazaniem wykonania metody
	# "_on_DefensiveTowerAlpha_tower_alpha_shoot", którą znadjuje się
	# w obiekcie WaterPump /metoda skaluje \wizualizacja\ obiekt...
	#
	# jakkolwiek - podłączenie sygnału w edytorze - jest aktywne...
	
	# january 26, 2022
	# przygotować mechanizm zarządzania grupami obiektów
	add_to_group("towers")
	
	pass
	
	
#func _process(delta):
#	pass
	
	
func _physics_process(delta):
	if $Base/TowerBaseAlpha:
		if $Base/TowerBaseAlpha.health <= 0 :
			self.queue_free()
		
		
	if(my_target):
		if (tower_process_enabled and target_reference.get_ref()):
			if(target_reference.get_ref().on_scene):
				target_position = target_reference.get_ref().global_position
				tower_rotation = atan2(( global_position.x - target_position.x ),
						( global_position.y - target_position.y ))
				
				tower_rotation = tower_rotation + self.rotation
				
				distance_to_target = global_position.distance_to(target_position)
				
				if(distance_to_target <= tower_shot_range):
					$Base/Turret.rotation_degrees = -rad2deg(tower_rotation)
					shooting = true
				else:
					shooting = false
				pass
			
			if(shooting and not prev_shooting and can_shoot_animation):
				create_bullet()
				$AnimationPlayerTowerAlpha.play("tower_alpha_animation")
				$AnimationPlayerTowerAlpha.playback_speed = shot_speed
				can_shoot_animation = false
				pass
			if(not shooting_series):
				prev_shooting = shooting
	pass
	
	
func create_bullet():
	
	# signal test...
	emit_signal("tower_alpha_shoot")
	
	# bullet - creation of an instance
	var bullet = bullet_data.instance()
	# bullet - position
	bullet.position = $Base/Turret/bullet_start_Position2D.global_position
	# bullet - scale
	bullet.global_scale = global_scale * created_bullet_scale_factor
	# bullet - speed
	bullet.bullet_speed = created_bullet_speed
	# bullet - direction vector
	bullet_vector = (target_position - global_position).normalized()
	bullet.bullet_direction = Vector2(bullet_vector)
	# bullet - rotation
	bullet.global_rotation_degrees = $Base/Turret.rotation_degrees
	# caliber
	bullet.caliber = bullet_caliber
	# add a projectile to the scene
	get_parent().add_child(bullet)
	pass
	
	
func setTarget( target ):
	my_target = target
	target_reference = weakref(my_target)
	tower_process_enabled = true
	pass


func _on_AnimationPlayerTowerAlpha_animation_finished( anim_name ):
	can_shoot_animation = true
	pass
	
	
func alfa():
	self.scale.x = 2.0
	pass
