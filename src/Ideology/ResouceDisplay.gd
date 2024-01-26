extends Node2D

var inspiration
var wealth
var ideology
# Called when the node enters the scene tree for the first time.
func _ready():
	inspiration = 0
	wealth = 0
	pass # Replace with function body.
	
	
func set_ideology(ideology):
	self.ideology = ideology
	var call = Callable(self,"_on_inspiration_updated")
	self.ideology.connect("inspiration_updated",call)
	
	
func set_inspiration(inspiration):
	self.inspiration = inspiration
	update_display()

func _on_inspiration_updated():
	set_inspiration(ideology.inspiration)

func set_wealth(wealth):
	self.wealth = wealth
	update_display()

func update_display():
	$Inspiration/val.text = str(ideology.inspiration)
	$Wealth/val.text = str(ideology.wealth)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	update_display()
	pass
