extends Node2D

var ideology
var transformation
signal exited
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_ideology(ideology):
	self.ideology = ideology
	$IdeologyGraph.set_ideology(self.ideology)
	$ResouceDisplay.set_ideology(self.ideology)
	
func set_transformation(transformation):
	self.transformation = transformation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_btn_pressed():
	exited.emit()
	self.hide()



func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		transformation.show()
	pass # Replace with function body.
