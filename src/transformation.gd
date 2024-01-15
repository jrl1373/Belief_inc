extends Node2D
const Attribute = preload("res://src/AttributeEnum.gd")
var Attributes = Attribute.Attributes
var attribute_names = ["Spotlight","Aesthetics","Control","Wellness","Income"]
var title = ""
var image = "res://icon.svg"
var attributes = [0,0,0,0,0]
var flavor = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/Panel/Title.text = title
	$MarginContainer/Panel/Flavor.text = flavor
	$MarginContainer/Panel/Image.texture = load(image)
	for i in range(len(attributes)):
		var label = Label.new()
		label.text = attribute_names[i] + ": "+  str(attributes[i])
		$MarginContainer/Panel/Attributes.add_child(label)
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("hello")
	pass

	
