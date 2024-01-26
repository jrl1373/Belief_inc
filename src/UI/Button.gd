extends Node2D

@export var text: String
signal pressed()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	$Label.text = text
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_property_list_changed():
	$Label.text = text
	pass # Replace with function body.


func _on_button_pressed():
	pressed.emit()
	pass # Replace with function body.
