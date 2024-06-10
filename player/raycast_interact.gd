extends RayCast3D

@onready var hold_pos = $HoldPosition
@onready var LaunchBall_point = $"../LaunchBall"
@onready var gun_barrel = $"../Rifle"

@onready var is_held = false

@onready var old_pos
@onready var old_rot

var number_of_throws: int = 0

signal ball_thrown

func launch_ball():
	if LaunchBall_point != null:
		
		var ball_launch_scene = preload("res://entities/ball_launch.tscn")
		var bls_instance = ball_launch_scene.instantiate()
		
		bls_instance.position = gun_barrel.global_position
		bls_instance.transform.basis = gun_barrel.global_transform.basis
		var ball_launch_camera = bls_instance.get_node("ball_launch_camera")
		get_node("/root/world").add_child(bls_instance)
		
		ball_launch_camera.make_current()
		


func _physics_process(delta):
	
	if self.is_colliding():
		var collider = self.get_collider()
		var obj_col = collider.get_parent()

		### PICKING UP BALL ###

		if Input.is_action_just_pressed("interact") && is_held == false:
			old_pos = obj_col.get_global_transform()
			old_rot = obj_col.rotation_degrees
			
			obj_col.get_parent().remove_child(obj_col)
			hold_pos.add_child(obj_col)
			obj_col.transform.origin = Vector3(0,0,0)
			obj_col.rotation_degrees = Vector3(0,0,0)
			is_held = true

		### THROWING BALL ###

		elif Input.is_action_just_pressed("interact") && is_held == true:
			hold_pos.remove_child(obj_col)
			get_node("/root/world").add_child(obj_col)
			
			obj_col.transform.origin = old_pos.origin
			obj_col.rotation_degrees = old_rot
			
			launch_ball()
			ball_thrown.emit()

			is_held = false



