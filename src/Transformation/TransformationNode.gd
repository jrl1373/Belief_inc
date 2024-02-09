extends Button


@export var transformation_card: PackedScene

var transformation = []
var showing = false
var card_offset = Vector2(50,-100)
var added = false
signal add_transformation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	
func init(transform):
	transformation = transform
	self.text = transformation[1]
	



func _on_add_transformation():
	if !added:
		added = true
		self.add_theme_color_override("font_color",Color("Green"))
		add_transformation.emit()
	toggle_card()
	pass
func toggle_card():
	if !showing:
		var card = transformation_card.instantiate()
		card.position = get_local_mouse_position() + card_offset
		card.init(transformation)
		card.connect("add_transformation",Callable(self,"_on_add_transformation"))
		self.add_child(card)
		showing = true
	elif showing:
		$Transformation.queue_free()
		showing = false

func _on_pressed():
	toggle_card()
	pass # Replace with function body.
