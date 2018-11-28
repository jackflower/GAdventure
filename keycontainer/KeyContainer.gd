extends Node2D

# 2018-10-27 acodemia.pl

var item

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
#func _physics_process(delta):
#	pass
	
#func _process(delta):
#	pass
	
	
func _on_Area2D_body_entered( body ):
	
	# prawo do aktywacji czujnika schowka na klucze ma tylko Player
	if(body.has_method("update_item")):
		print (body.name + " szuka klucza")
		#uruchomienie animacji otwierania schowka
		$Cover/AnimationPlayerCover.play("animation_cover")
		#deaktywacja sygnału - czujnik schowka został użyty
		$Body.disconnect("body_entered", self, "_on_Area2D_body_entered")
	pass
	
	
func _on_AnimationPlayerCover_animation_finished( anim_name ):
	#zatrzymanie animacji czerwonego sygnalizatora na korpusie schowka
	$Body/AnimationPlayerBody.stop()
	#ukrycie czerwonego sygnalizatora
	$Body/Sprite/Sprite_indicator_red.hide()
	#włączenie widocznosci zielonego sygnalizatora
	$Body/Sprite/Sprite_indicator_green.show()
	#uruchomienie animacji zielonego sygnalizatora
	$Body/AnimationPlayerBody.play("animation_green")
	#ustawienie mniejszej prędkości odtwarzania
	$Body/AnimationPlayerBody.playback_speed = 0.5
	pass
	
	
func _on_Key_body_entered( body ):
	# prawo do klucza ma tylko Player
	if(body.has_method("update_item")):
		item = $Body/Key.name
		body.update_item( item )
		# queue_free() # zagadka
	pass
