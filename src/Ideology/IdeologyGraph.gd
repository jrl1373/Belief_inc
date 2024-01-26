extends Node2D

var ideology
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_ideology(ideology):
	self.ideology = ideology
	var call = Callable(self,"_on_ideology_updated")
	self.ideology.connect("attributes_updated",call)
	
	
func _on_ideology_updated():
	var attributes = ideology.get_attributes()
	_on_ideology_attribute_update(attributes)
	
	
	
	
func update_attribute(attribute,value):
	var bar = self.get_node(attribute+"Bar")
	var val = self.get_node(attribute+"Bar/"+ attribute+"Val")
	val.text = str(value)
	bar.size.y = max(4*value,0)
	
	


func _on_ideology_attribute_update(attributes):
	var attribute_names = ["Spotlight","Aesthetics","Control","Wellness","Income"]
	for i in range(len(attributes)):
		update_attribute(attribute_names[i],attributes[i])
	
	pass # Replace with function body.
