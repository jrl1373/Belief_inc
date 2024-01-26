extends Node2D
const Attribute = preload("res://src/AttributeEnum.gd")
var Attributes = Attribute.Attributes
var attribute_names = ["Spotlight","Aesthetics","Control","Wellness","Income"]
var title = ""
var image = "res://icon.svg"
var attributes = [0,0,0,0,0]
var flavor = ""
var added = false
var tier = "1"
signal add_transformation(attributes)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.text = title
	$Flavor.text = flavor
#	$MContainer/Panel/Image.texture = load(image)
	for i in range(len(attributes)):
		var label = Label.new()
		label.add_theme_color_override("font_color","Black")
		label.text = attribute_names[i] + ": "+  str(attributes[i])
		$Attributes.add_child(label)
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	
func init(vals):
	print("e")
	self.title = vals[1]
	self.attributes = vals.slice(2,7)
	self.image = vals[8]
	self.flavor = vals[7]
	self.tier = vals[10]
	update_transformation()

func update_transformation():
	$Title.text = title
	$Flavor.text = flavor
	$Cost/Val.text = str(10+(20*(int(tier)-1)))
#	$MContainer/Panel/Image.texture = load(image)
	var idx = 0
	for i in $Attributes.get_children():
		var label = i
		label.text = attribute_names[idx] + ": "+  str(attributes[idx])
		idx += 1
	pass # Replace with function body.
		


func _on_button_pressed():
	add_transformation.emit(attributes)
