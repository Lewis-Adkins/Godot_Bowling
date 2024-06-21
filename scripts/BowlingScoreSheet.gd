### ATTACHED TO: enviroment/ScoreScreen/BowlingScoreSheet ###

extends Sprite3D

@onready var all_frames = get_node("../../frame_calculation").all_frames
 
func filling_score_card()->void:
	
	var final_score = get_node("../../frame_calculation").final_score
	var number_of_frames: int = all_frames.size()+1
	var scores_per_frame: int = 4 # Score per frame + 1 because of iterator... its really 3
	var frame_labels: Node
	
	print(final_score)
	
	var final_score_label:Node
	
	final_score_label = get_node("Final_Score")
	
	var final_score_input: String = str(final_score)
	
	final_score_label.set_text(final_score_input)

	for frames in range(1, number_of_frames):
		for scores in range(1, scores_per_frame):
			frame_labels = get_node("Frame_"+str(frames)+"_"+str(scores))
			
			var score_input: String = str(all_frames["Frame #" + str(frames)][scores-1])
			
			if str(all_frames["Frame #" + str(frames)][0]) == "10":
				score_input = "X"
				
			if str(all_frames["Frame #" + str(frames)][2]) == "10" && str(all_frames["Frame #" + str(frames)][0]) != "10"  :
				score_input = "/"

			frame_labels.set_text(score_input)

func _ready():
	pass # Replace with function body.

func _process(delta):
	
	filling_score_card()
	
	
