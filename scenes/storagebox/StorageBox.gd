extends Area2D

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
	
	
func _on_StorageBox_body_entered( body ):
	# prawo do aktywacji czujnika schowka na klucze ma tylko Player
	#if(body.is_in_group("Gracze")): # docelowa implementacja
	if(body.has_method("update_item")):
		print (body.name + " szuka klucza")
		#uruchomienie animacji otwierania schowka
		$AnimationPlayer.play("storagebox_animation_open")
		#deaktywacja sygnału - czujnik schowka został użyty
		self.disconnect("body_entered", self, "_on_StorageBox_body_entered")
	pass
	
	
func _on_BrassKey_body_entered( body ):
	# prawo do klucza ma tylko Player
	#if(body.is_in_group("Gracze")): # docelowa implementacja
	if(body.has_method("update_item")):
		item = $BrassKey.name
		body.update_item( item )
		# queue_free() # zagadka
	pass
	
	
