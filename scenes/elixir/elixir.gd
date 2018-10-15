extends Area2D


func _ready():
	#set_physics_process(true)
	#set_process(true)
	pass
	

func _process(delta):
	
	pass


func _on_Elixir_body_entered( body ):
	print (body.name)
	if(body.has_method("update_item")):
		#print("Alfa")
		body.update_item()
	#queue_free()
	pass
