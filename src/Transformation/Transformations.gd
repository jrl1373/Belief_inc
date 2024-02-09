extends Node
@export var transformation_scn: PackedScene
@export var transformation_nd: PackedScene
signal add_transformation(attributes)
var transformations = {}
var transformation_dict = {'s':{'1':[],'2':[],'3':[]},'a':{'1':[],'2':[],'3':[]},'c':{'1':[],'2':[],'3':[]},
'w':{'1':[],'2':[],'3':[]},'i':{'1':[],'2':[],'3':[]}}
func import_transformations(filename):
	var file = FileAccess.open(filename,FileAccess.READ)
	var key = Array(file.get_csv_line())
	while !file.eof_reached():
		var entry = Array(file.get_csv_line())	
		if entry.size() == key.size():
			transformations[transformations.size()] = entry
	file.close()
	for i in transformations.keys():
		var transform = transformations[i]
		transformation_dict[transform[9]][transform[10]].append(transform)
	return transformation_dict
# Called when the node enters the scene tree for the first time.
func _ready():
	transformations = import_transformations("res://Final_Transformation_List.txt")
	
	pass # Replace with function body.

func legacy_transformation_import(transformations):
	for i in transformations.keys():
		var transform = transformations[i]
		var transformation = transformation_scn.instantiate()
		var node = transformation_nd.instantiate()
		transformation.init(transform)
		$HBoxContainer.add_child(node)
		node.init(transform)
		node.connect("add_transformation",func(): add_transformation.emit(transform))


func _on_transformation_added():
	pass

func send_transformation(branch,tier,idx):
	var transform = transformation_dict[branch][tier][idx]
	add_transformation.emit(transform)

func get_transformation(id):
	return transformations[id]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
