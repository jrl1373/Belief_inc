extends Node2D
var branch = "s"
var branch_transformations = [0,0,0,0,0]
var att_map = ['s','a','c','w','i']
var tier = "1"
var idx = 0
var ideology
var added_transformations = []
var transformation = load("res://src/Transformation/Transformations.gd").new()
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


func set_ideology(ideology):
	self.ideology = ideology
	$ResouceDisplay.set_ideology(ideology)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_branch(branch):
	print(branch)
	self.branch = branch
	update_filter()
	



func _on_transformation_branch_load_transformation(tier, idx):
	print("ssss")
	self.tier = str(tier)
	self.idx = idx
	var transform = transformation_dict[branch][self.tier][self.idx]
	$Transformation.init(transform)
	pass # Replace with function body.


func _on_exit_pressed():
	self.hide()
	pass # Replace with function body.

func update_filter():
	if branch_transformations[att_map.find(branch)] < 1:
		$Filter.size.y = 350
	elif branch_transformations[att_map.find(branch)] < 6:
		$Filter.size.y = 150
	else:
		$Filter.size.y = 0
	print($Filter.size)
	
	
func _on_transformation_add_transformation(attributes):
	var total_transforms = branch_transformations[att_map.find(branch)]
	if int(tier) == 2 and total_transforms < 1:
		print("error")
	elif int(tier) == 3 and total_transforms < 6:
		print("error")
	elif !added_transformations.has(Vector2(int(tier),int(idx))):	
		var cost = 10+20*(int(tier)-1)
		if ideology.inspiration >= cost:
			ideology.add_inspiration(-1*cost)
			branch_transformations[att_map.find(branch)] += 1
			update_filter()
			added_transformations.append(Vector2(int(tier),int(idx)))
			add_transformation.emit(attributes)
		else:
			print("error")
