### ATTACHED TO: entities/ball_launch.tscn ###

extends RigidBody3D

const SPEED = 200.0

const ANGULAR_SPEED = SPEED/.1

var hasAppliedImpulse = false

@onready var mesh = $ball_launch_mesh
@onready var ray = $ball_launch_raycast

func launch_ball_direction() -> void:
	if hasAppliedImpulse == false:
		
		var ray_direction = ray.global_transform.basis.y
		apply_central_impulse(-ray_direction * SPEED)
		apply_torque(-ray.global_transform.basis.x * ANGULAR_SPEED) 
		
		hasAppliedImpulse = true

func _physics_process(delta):
	launch_ball_direction()

func _on_ball_launch_timer_timeout():
	queue_free()

func _on_tree_entered():
	pass # Replace with function body.
