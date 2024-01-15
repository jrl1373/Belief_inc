extends Node2D
enum Attributes {SPOTLIGHT,AESTHETICS,CONTROL,WELLNESS,INCOME}
var attributes = [0,0,0,0,0]
var wealth = 0
var initiative = 0
var inspiration = 0
var aware = 0
var followers = 0
var actors = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _init(attributes, wealth, initiative, inspiration, aware, followers,actors):
	self.attributes = attributes
	self.wealth = wealth
	self.initiative = initiative
	self.inspiration = inspiration
	self.aware = aware
	self.followers = followers
	self.actors = actors
	


func update_attributes(transformation):
	for i in range(len(transformation)):
		attributes[i] += transformation[i]
	
func get_attribute(Attribute):
	return attributes[Attribute]
