extends Node2D

# 2018-12-01
# Acodemia - testowanie gotowej gry
#

func _ready():
	$Tower.setTarget($Player)
	$DefensiveTowerAlpha.setTarget($Player)
	$DefensiveTowerBeta.setTarget($Player)
	$DefensiveTowerGamma.setTarget($Player)
	$DefensiveTowerDelta.setTarget($Player)
	$WatchTower.setTarget($Player)
	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
