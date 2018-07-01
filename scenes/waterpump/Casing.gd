extends StaticBody2D

# Scinfor - jackflower
# April 11, 2018
#
# The scene represents the cover of the pump mechanism

var area_casing = false # mouse pointer in the area of the engine cover


func _ready():
	pass


func _process(delta):
	pass


func _fixed_process(delta):
	pass


func _on_Casing_mouse_entered():
	$Label.visible = true
	$Label.text = "Casing"
	area_casing = true
	pass

func _on_Casing_mouse_exited():
	$Label.visible = false
	$Label.text = ""
	area_casing = false
	pass
