extends Area2D

# 2018-10-20 acodemia.pl

var item

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
	
func _on_Elixir_body_entered( body ):
	print (self.name + ": znalazł mnie " + body.name)
	if(body.has_method("update_item")):
		item = self.name
		body.update_item( item )
	#queue_free() # zagadka
	pass
	
