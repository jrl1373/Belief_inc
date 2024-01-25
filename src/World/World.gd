extends Node2D

var speed = .4
var point = Vector2(0,0)
var t = 0
var mapspeed = 100
var map_angle = randf()*2*PI
# Called when the node enters the scene tree for the first time.
func _ready():
	$Advisor.play()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_advisor(delta)
	move_map(delta)
	
	pass
func move_map(delta):
	var width = $Map.texture.get_width()
	var height = $Map.texture.get_height()
	if $Map.position.x > width/2:
		map_angle+=PI/2
	if $Map.position.x < -1*((width/2)-get_window().size.x):
		map_angle+=PI/2
	if $Map.position.y > height/2:
		map_angle+=PI/2
	if $Map.position.y < -1*((height/2)-get_window().size.y):
		map_angle+=PI/2
	$Map.position += mapspeed*delta * Vector2(1,1).rotated(map_angle)

func move_advisor(delta):
	$Advisor.rotate(1*delta)
	t+=speed*delta
	if Input.is_action_pressed("click"):
		point = get_local_mouse_position()
		t = 0
	if point != Vector2(0,0):
		$Advisor.position = $Advisor.position.lerp(point,t)
	
	
	

func _on_timer_timeout():
	var atr = $Ideology.attributes
	var spotlight = atr[0]
	var aesthetics = atr[1]
	var control = atr[2]
	$Country.calculate_population_change(spotlight,aesthetics,control)
	pass # Replace with function body.
