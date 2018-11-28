extends Area2D

# 2018-11-24 acodemia.pl

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
	
func _on_Teleport_body_entered( body ):
	
	print ("Ten teleport prowadzi do sceny ... Greed")
	# jeśli Gracz zebrał przynajmniej trzy
	# magiczne eliksiry wtedy
	# teleport przenosi Gracza  do sceny Greed
	
	if(body.elixirs >= 3):
		var sceneToLoad = preload("res://greed/Greed.tscn")
		get_tree().change_scene_to(sceneToLoad)
	pass
	
