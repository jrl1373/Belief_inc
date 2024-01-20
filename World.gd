extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var atr = $Ideology.attributes
	var spotlight = atr[0]
	var aesthetics = atr[1]
	var control = atr[2]
	$Country.calculate_population_change(spotlight,aesthetics,control)
	pass # Replace with function body.
