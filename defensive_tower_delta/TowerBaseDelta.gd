extends StaticBody2D

# logika: docelowo zbudować logikę opartą na sygnałach
# Wieża defensywna  D e l t a
# ten obiekt jest skadową kompletnego obiektu
# obiekt aktualizuje swój stan
#
# obiekt może być umieszczony niezależnie na scenie
# aktualizując swój stan - health
#

var health: float = 100

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
	
