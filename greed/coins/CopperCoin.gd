extends Area2D

# 2018-11-21 acodemia.pl

var coin

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
	
func _on_CopperCoin_body_entered( body ):
	print (self.name + ": znalazł mnie " + body.name)
	if(body.has_method("update_cash_copper")):
		coin = self.name
		body.update_cash_copper( coin )
		queue_free()
	pass
	