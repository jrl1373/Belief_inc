extends Node2D
@export var jan: PackedScene
var speed = .4
var point = Vector2(0,0)
var t = 0
var mapspeed = 100
var map_angle = randf()*2*PI
var width
var height
var max_jans = 50
var current_jans = 0
var paused = false
var ideology = load("res://src/Ideology/Ideology.gd").new()
var ideology_page = load("res://src/Ideology/IdeologyPage.tscn").instantiate()
var transformation_page = load("res://src/Transformation/transformation_page.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	width = $Map.texture.get_width()
	height = $Map.texture.get_height()
	print(ideology)
	ideology_page.set_ideology(ideology)
	print(transformation_page)
	ideology_page.set_transformation(transformation_page)
	ideology_page.connect("exited",func():paused = false )
	print(ideology_page.transformation)
	var call = Callable(self,"add_transform")
	transformation_page.connect("add_transformation",call)
	transformation_page.set_ideology(ideology)
	$IdeologyDisplay.set_ideology(ideology)
	$ResouceDisplay.set_ideology(ideology)
	print("current Ideology")
	print($IdeologyDisplay.get_ideology())
	$Advisor.play()
	$Advisor.scale = Vector2(.1,.1)
	get_tree().call_group("jans","play")
	add_child(ideology_page)
	ideology_page.hide()
	add_child(transformation_page)
	transformation_page.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !paused:
		move_advisor(delta)
		move_map(delta)
		
	pass
func move_map(delta):
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
	$Advisor.position = get_local_mouse_position()
#	t+=speed*delta
#	if Input.is_action_pressed("click"):
#	point = get_local_mouse_position()
#	t = 0
#	if point != Vector2(0,0):
#		$Advisor.position = $Advisor.position.lerp(point,t)
	
	
	

func _on_timer_timeout():
	if !paused:
		if current_jans < max_jans:
			generate_jan()
		var atr = $IdeologyDisplay.attributes
		var spotlight = atr[0]
		var aesthetics = atr[1]
		var control = atr[2]
		$Country.calculate_population_change(spotlight,aesthetics,control)


func generate_jan():
	var new_jan = jan.instantiate()
	var janx = randi_range((-1*width/2)+100,(width/2)-100)
	var jany = randi_range((-1*height/2)+100,(height/2)-100)
	new_jan.position = $Map.position + Vector2(janx,jany)
	$Map.add_child(new_jan)
	var call = Callable(self,"harvested_jan")
	new_jan.connect("harvested",call)
	new_jan.play()
	current_jans +=1
	pass

func harvested_jan():	
	current_jans -= 1
	ideology.add_inspiration(1)
	$ResouceDisplay.set_inspiration(ideology.inspiration)
	
func _on_button_pressed():
	pass # Replace with function body.
	
func add_transform(transform):
	$IdeologyDisplay.update_attributes(transform)
	pass

func _on_transformation_button_pressed():
	transformation_page.show()
	pause()
#	add_child(transformation_page)
	pass # Replace with function body.


func _on_ideology_button_pressed():
	ideology_page.show()
	pause()


func pause():
	paused = true



func _on_country_new_actors(new_actors):
	max_jans += new_actors/10
	for i in range(int(new_actors/10)):
		generate_jan()
	pass # Replace with function body.
