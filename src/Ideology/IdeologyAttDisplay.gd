extends Node2D
enum Attributes {SPOTLIGHT,AESTHETICS,CONTROL,WELLNESS,INCOME}
var attributes = [0,0,0,0,0]
var wealth = 0
var initiative = 0
var inspiration = 0
var aware = 0
var followers = 0
var actors = 0
var ideology = Script
signal attribute_update(transformation)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_ideology(ideology):
	print(ideology)
	self.ideology = ideology
	print(self.ideology)
	
func get_ideology():
	return ideology

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("E")
	ideology.update_attributes([1,1,1,1,1])
	pass # Replace with function body.


func init(attributes, wealth, initiative, inspiration, aware, followers,actors):
	ideology.init(attributes, wealth, initiative, inspiration, aware, followers,actors)
#	self.attributes = attributes
#	self.wealth = wealth
#	self.initiative = initiative
#	self.inspiration = inspiration
#	self.aware = aware
#	self.followers = followers
#	self.actors = actors
	


func update_attributes(transformation):
	ideology.update_attributes(transformation)
	for i in range(len(transformation)):
		attributes[i] += int(transformation[i])
	var idx = 0
	print("eee")
	attribute_update.emit(attributes)
	var att_order = ['s','a','c','w','i']
	var vals = get_tree().get_nodes_in_group("attribute_values")
	for val in vals:
		var char = val.name.substr(0,1)
		val.text = str(attributes[att_order.find(char)])
		idx+=1
		
		
	
func get_attribute(Attribute):
	return attributes[Attribute]
	

func _on_transformations_add_transformation(attributes):
	ideology.update_attributes(attributes.slice(2,7))
#	print("added")
#	update_attributes(attributes.slice(2,7))
	pass # Replace with function body.
