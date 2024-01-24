extends Node2D

var speed = .4
var point = Vector2(0,0)
var t = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Advisor.play()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Advisor.rotate(1*delta)
	t+=speed*delta
	if Input.is_action_pressed("click"):
		point = get_local_mouse_position()
		t = 0
	if point != Vector2(0,0):
		$Advisor.position = $Advisor.position.lerp(point,t)
		
	pass


func _on_timer_timeout():
	var atr = $Ideology.attributes
	var spotlight = atr[0]
	var aesthetics = atr[1]
	var control = atr[2]
	$Country.calculate_population_change(spotlight,aesthetics,control)
	pass # Replace with function body.
