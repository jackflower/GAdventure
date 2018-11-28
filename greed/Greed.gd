extends Node2D

# 2018-11-21 acodemia.pl

var gold = 0
var gold_allowed_amount = 3

func _ready():
	set_physics_process(true)
#	#set_process(true)
	pass
	
#func _process(delta):
#	pass
	
func _physics_process(delta):
	if($Player.cash_gold > gold_allowed_amount):
		print("Chciwość nie popłaca")
		var sceneToLoad = preload("res://greed/jail/Jail.tscn")
		get_tree().change_scene_to(sceneToLoad)
	pass
	
