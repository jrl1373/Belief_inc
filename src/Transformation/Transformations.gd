extends Node
@export var transformation_scn: PackedScene
@export var transformation_nd: PackedScene
signal add_transformation(attributes)
var transformations = {}
func import_transformations(filename):
	var file = FileAccess.open(filename,FileAccess.READ)
	var key = Array(file.get_csv_line())
	while !file.eof_reached():
		var entry = Array(file.get_csv_line())	
		if entry.size() == key.size():
			transformations[transformations.size()] = entry
	file.close()
	print(transformations)
	return transformations
# Called when the node enters the scene tree for the first time.
func _ready():
	transformations = import_transformations("res://Transformtations_table.txt")
	for i in transformations.keys():
		var transform = transformations[i]
		var transformation = transformation_scn.instantiate()
		var node = transformation_nd.instantiate()
		transformation.init(transform)
		$HBoxContainer.add_child(node)
		node.init(transform)
		node.connect("add_transformation",func(): add_transformation.emit(transform))
	pass # Replace with function body.

func _on_transformation_added():
	print("e")
	pass


func get_transformation(id):
	return transformations[id]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
