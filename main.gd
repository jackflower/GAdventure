extends Node2D


func _ready():
	$Tower.setTarget($Player)
	$DefensiveTowerAlpha.setTarget($Player)
	$DefensiveTowerAlpha.setTarget($Shaggy)
	$DefensiveTowerBeta.setTarget($Player)
	$DefensiveTowerGamma.setTarget($Player)
	$DefensiveTowerDelta.setTarget($Player)
	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
