extends Node2D
enum Attributes {SPOTLIGHT,AESTHETICS,CONTROL,WELLNESS,INCOME}
var attributes = [0,0,0,0,0]
var wealth = 0
var initiative = 0
var inspiration = 0
var aware = 0
var followers = 0
var actors = 0

signal attribute_update(transformation)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("E")
	update_attributes([1,1,1,1,1])
	pass # Replace with function body.


func init(attributes, wealth, initiative, inspiration, aware, followers,actors):
	self.attributes = attributes
	self.wealth = wealth
	self.initiative = initiative
	self.inspiration = inspiration
	self.aware = aware
	self.followers = followers
	self.actors = actors
	


func update_attributes(transformation):
	for i in range(len(transformation)):
		attributes[i] += int(transformation[i])
	var idx = 0
	print("eee")
	attribute_update.emit(attributes)
	var vals = get_tree().get_nodes_in_group("attribute_values")
	for val in vals:
		val.text = str(attributes[idx])
		idx+=1
		
		
	
func get_attribute(Attribute):
	return attributes[Attribute]







func _on_transformations_add_transformation(attributes):
	print("added")
	update_attributes(attributes.slice(2,7))
	pass # Replace with function body.
