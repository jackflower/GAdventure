extends StaticBody2D

# logika: docelowo zbudować logikę opartą na sygnałach
# Wieża defensywna  G a m m a
# ten obiekt jest skadową kompletnego obiektu
# obiekt aktualizuje swój stan

var health: float = 10

func _ready():
	set_physics_process(true)
	#set_process(true)
	pass
	
	
#func _process(delta):
#	pass
	
	
func _physics_process(delta):
	if(health <= 0):
		self.queue_free()
		pass
	pass
	
	
func update_health(damage):
	if(health):
		health -= damage
	pass
	
