extends Area2D

# 2019-01-05 acodemia.pl

var explosion = null
#var texture_number # losowana tekstura
#var mine_explosion_damage # losowane siła rażenia eksplozji
#var explosion_animation_speed # losowana prędkość odtwarzania animacji eksplozji 

func _ready():
	randomize()
	var texture_number = int(rand_range(1, 4))
	explosion = preload("res://mine/MineExplosion.tscn").instance()
	var mine_explosion_damage = rand_range(10, 50)
	explosion.damage = mine_explosion_damage
	var explosion_animation_speed = rand_range(0.125, 2)
	explosion.get_node("AnimationPlayer").playback_speed = explosion_animation_speed
	var explosion_scale = rand_range(0.5, 3)
	explosion.get_node(".").scale.x = explosion_scale
	explosion.get_node(".").scale.y = explosion_scale
	
	if(texture_number == 1):
		explosion.get_node("Sprite").texture = preload("res://mine/explosions/green_explode.png")
	if(texture_number == 2):
		explosion.get_node("Sprite").texture = preload("res://mine/explosions/blue_explode.png")
	if(texture_number == 3):
		explosion.get_node("Sprite").texture = preload("res://mine/explosions/red_explode.png")
	pass
	
	
func createExplosion():
	explosion.get_node("AnimationPlayer").play("explode")
	add_child(explosion)
	pass
	
	
func _on_Mine_body_entered( body ):
	$AnimationPlayer.play("flap_animation")
	$CollisionShape2D.disabled = true
	pass
	
	
func _on_AnimationPlayer_animation_finished( anim_name ):
	createExplosion()
	pass
	
