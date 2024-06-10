extends Camera3D

@onready var ball := get_parent()
var camera_stop_point_z = -22

func _process(delta):
	set_as_top_level(true)
	position.z = ball.position.z + 5
	
	if position.z <= camera_stop_point_z:
		position.z = camera_stop_point_z

