extends Node2D

signal harvested
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Rep1lace with function body.

func play():


	var animations = $Jan1.sprite_frames.get_animation_names()
	var random = randi() % len(animations)
	var animation = animations[random]
	$Jan1.play(animation)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_mouse_entered():
	harvested.emit()
	queue_free()
	pass # Replace with function body.
