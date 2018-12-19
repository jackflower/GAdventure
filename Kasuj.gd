extends Sprite

signal shoot(bullet, direction, location)

#var Bullet = preload("res://BulletKas.tscn")
var Bullet = preload("res://scenes/shooting/bullet/Bullet.tscn")

func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed:
            emit_signal("shoot", Bullet, rotation, position)

func _process(delta):
    look_at(get_global_mouse_position())
	

#sygnał działa, ale mechanika...
func _on_Kasuj_shoot( bullet, direction, location ):
	var b = Bullet.instance()
	add_child(b)
	b.rotation = direction
	b.position = location
	#b.bullet_speed=b.bullet_speed#.rotated(direction)
	pass # replace with function body
