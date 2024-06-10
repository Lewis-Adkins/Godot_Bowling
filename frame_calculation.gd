extends Node3D

@onready var ball_thrown_node = $"../Player/TwistPivot/PitchPivot/Camera3D/RayCast_player"
@onready var pillar_pyramid = $"../pillar_pyramid"

var number_of_throws: int = 0
var number_of_frames: int = 10

var two_throw_frame_score: Vector3
var two_throw_frame_score_combined : int

var final_score: int = 0

var all_frames : Dictionary
var frame_label: String
var your_frame : int = 1
var frame_index: int = 0

var strike_code: String = "X"

func _ready():
	ball_thrown_node.ball_thrown.connect(_on_ball_thrown)
	
func record_throw_score(score: int) -> int:

	var throw_score: int = 0
	throw_score += score
	return throw_score

func _on_ball_thrown() -> Array:
	number_of_throws += 1
	if number_of_throws == 3:
		
		frame_index += 1
		final_score += all_frames["Frame #" + str(frame_index)][2]
		
		your_frame += 1
		two_throw_frame_score = Vector3(0,0,0)
		
		
		number_of_throws = 1
		
	return [number_of_throws, your_frame, final_score]
	
func store_throw_score(pins_knocked: int, two_throw_frame_score: Vector3, recorded_throw_score: int):
	recorded_throw_score = record_throw_score(pins_knocked)
	two_throw_frame_score[0] = recorded_throw_score
	
func _process(delta):
	
	var sum_of_points = pillar_pyramid.sum_of_points
	
	frame_label = "Frame #" + str(your_frame) 
	all_frames[frame_label] =  two_throw_frame_score

	if number_of_throws == 1:
		var first_score: int = record_throw_score(sum_of_points)
		
		#if first_score == 10:
			#two_throw_frame_score[0] = 5
			
		#else:
			
		two_throw_frame_score[0] = first_score

	elif number_of_throws == 2:
		var second_score: int = record_throw_score(sum_of_points)	
		second_score = second_score - two_throw_frame_score[0]
		two_throw_frame_score[1] = second_score

	two_throw_frame_score_combined = two_throw_frame_score[0] + two_throw_frame_score[1]
	two_throw_frame_score[2] = two_throw_frame_score_combined
	

	



