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
	
	
func _on_Portal_body_entered( body ):
	
	print ("Ten teleport prowadzi do sceny ... Swamp")
	# jeśli Gracz zebrał przynajmniej trzy
	# magiczne eliksiry wtedy
	# teleport przenosi Gracza  do sceny Swamp
	
	if(body.elixirs >= 3):
		var sceneToLoad = preload("res://swamp/Swamp.tscn")
		get_tree().change_scene_to(sceneToLoad)
	pass
	
