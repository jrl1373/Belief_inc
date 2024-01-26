extends Node2D
var branch = "s"
var tier = "1"
var idx = 0
var transformation = preload("res://src/Transformation/transformations.gd").new()
var transformation_dict = transformation.import_transformations("res://Final_Transformation_List.txt")
signal add_transformation(attributes)
# Called when the node enters the scene tree for the first time.
func _ready():
	var call = Callable(self,"set_branch")
	$Btns/SpotlightBtn.connect("pressed",call.bind("s"))
	$Btns/AestheticsBtn.connect("pressed",call.bind("a"))
	$Btns/ControlBtn.connect("pressed",call.bind("c"))
	$Btns/WellnessBtn.connect("pressed",call.bind("w"))
	$Btns/IncomeBtn.connect("pressed",call.bind("i"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_branch(branch):
	print(branch)
	self.branch = branch
	



func _on_transformation_branch_load_transformation(tier, idx):
	print("ssss")
	self.tier = str(tier)
	self.idx = idx
	var transform = transformation_dict[branch][self.tier][self.idx]
	$Transformation.init(transform)
	pass # Replace with function body.


func _on_exit_pressed():
	queue_free()
	pass # Replace with function body.


func _on_transformation_add_transformation(attributes):
	add_transformation.emit(attributes)
	pass # Replace with function body.
