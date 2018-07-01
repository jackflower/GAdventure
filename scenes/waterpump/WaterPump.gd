extends Node2D

# Scinfor - jackflower
# April 11, 2018
#
# The scene represents a water pump

var animation_casing
var animation_opening_engine_cover_name = "animation_opening_engine_cover"
var animation_closing_engine_cover_name = "animation_closing_engine_cover"


func _ready():
	set_process(true)
	set_process_input(true)
	animation_casing = animation_opening_engine_cover_name
	pass


func _process(delta):
	pass


func _fixed_process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index ==1 and $StaticBody2D/Casing.area_casing:
		if not $AnimationPlayerCasing.is_playing():
			playCasingAnimation(animation_casing)
	pass
	
	
func _on_engine_compartment_mouse_entered():
	#print("Komora silnika")
	pass


func _on_battery_compartment_mouse_entered():
	#print ("Panel akumulatora")
	pass


func _on_AnimationPlayerCasing_animation_finished( anim_name ):
	if( anim_name == animation_opening_engine_cover_name):
		animation_casing = animation_closing_engine_cover_name
	if( anim_name == animation_closing_engine_cover_name):
		animation_casing = animation_opening_engine_cover_name
	pass


func playCasingAnimation(animation_name):
	if(animation_casing):
		$AnimationPlayerCasing.play(animation_casing)
	pass
