extends Area2D

# 2019-11-23 acodemia.pl

var explosion = null
export (float) var animation_speed_min = 0.125
export (float) var animation_speed_max = 2.0
export (float) var explosion_damage_min = 10
export (float) var explosion_damage_max = 50

#export (float) var bullet_caliber = 2

func _ready():
	randomize()
	var texture_number = int(rand_range(1, 4))
	explosion = preload("res://mine_one/MineExplosionOne.tscn").instance()
	var mine_explosion_damage = rand_range(explosion_damage_min, explosion_damage_max)
	explosion.damage = mine_explosion_damage
	var explosion_animation_speed = rand_range(animation_speed_min, animation_speed_max)
	explosion.get_node("AnimationPlayer").playback_speed = explosion_animation_speed
	var explosion_scale = rand_range(0.5, 3)
	explosion.get_node(".").scale.x = explosion_scale
	explosion.get_node(".").scale.y = explosion_scale
	
	if(texture_number == 1):
		explosion.get_node("Sprite").texture = preload("res://mine_one/explode_green.png")
	if(texture_number == 2):
		explosion.get_node("Sprite").texture = preload("res://mine_one/explode_blue.png")
	if(texture_number == 3):
		explosion.get_node("Sprite").texture = preload("res://mine_one/explode_red.png")
	pass
	
	
func createExplosion():
	explosion.get_node("AnimationPlayer").play("explode")
	add_child(explosion)
	pass
	
	
func _on_Mine_body_entered( body ):
	$AnimationPlayer.play("flap_animation")
	$CollisionShape2D.disabled = true
	createExplosion()
	pass
	
	
func _on_AnimationPlayer_animation_finished( anim_name ):
	#createExplosion()
	queue_free()
	pass
	
	
func _on_Timer_timeout():
	createExplosion()
	pass
	
