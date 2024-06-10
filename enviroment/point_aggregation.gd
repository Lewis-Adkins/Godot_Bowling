extends Node3D

var number_of_pillars: int = 10
@export var sum_of_points: int = 0
var number_of_throws: int = 0


func sum(arr: Array) -> int:
	var result = 0
	for i in arr:
		result += i
	return result

func upright_check() -> Array:
	var knocked_states: Array = []
	for i in range(number_of_pillars):
		var pillar = get_child(i)
		var pillar_raycast = pillar.get_child(2)
		var pillar_knocked_state = pillar_raycast.is_knocked
		knocked_states.push_back(pillar_knocked_state)
	return knocked_states

func point_aggregation(states: Array) -> int:
	return sum(states)

func _process(delta):
	var states = upright_check()
	sum_of_points = point_aggregation(states)

	

	
