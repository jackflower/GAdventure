extends Node2D

# Przekazanie zmiennej do funkcji przez referencję

var a = 1 setget set_a
var b # is reference of a

func _ready():
	self.a = 10
	print(b) # b = 10
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_a(value):
	a = value
	b = a
	pass
	