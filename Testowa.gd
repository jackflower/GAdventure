extends Area2D


func _ready():
	#set_physics_process(true)
	#set_process(true)
	pass
	

func _process(delta):
	
	pass


func _on_Testowa_body_entered( body ):
	print (body.name)
	queue_free()
	pass
