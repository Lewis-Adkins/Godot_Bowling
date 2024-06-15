### ATTACHED TO: entities/pillar/upright_check ###

extends RayCast3D

var is_knocked: int 

func knock_check():
	is_knocked = false
	
	if is_colliding():
		pass
	else:
		is_knocked = true

func _process(delta):
	knock_check()
	
	
