extends Node2D

signal load_transformation(tier,idx)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var call = Callable(self,"signal_transformation")
	var leaves = get_tree().get_nodes_in_group("leaves")
	for node in leaves:
		node.connect("entered",call)
	pass # Replace with function body.


func signal_transformation(tier,idx):
	load_transformation.emit(tier,idx)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
