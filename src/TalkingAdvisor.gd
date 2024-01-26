extends Node2D
var welcome = "Welcome to Belief inc! we are dedicated to making your own ideology and having it spread around the world"
var t1 = "In order to do that, we must harvest the ideas of people around the world, keep a lookout for any people"
var t2 = "hovering over someone will harvest their inspiration which we can use to upgrade our ideology. Get 10 Inspiration for an upgrade"
var t3 = "Once you have 10 inspiration, click on the ideology tab"
var t4 = "See that pretty flower on the bottom left, that is a physical manifestation of your ideology. Give it a click"
var t5 = "Welcome to the transformation tab. There are 5 main branches, Spotlight, Aesthetics, Control, Wellness, and Income"
var t6 = "Spotlight increases how many people will become aware of our ideology, while aesthetics increases our followers, and control increases our actors"
var t7 = "Aware people can become followers and followers can become actors. The more actors we have, the more inspiration we can gain, and the more transformations we can have!"
var t8 = "Choose one of the branches, and then scroll over the white circles to decide a transformation"
var t9 = "Great! the more transformations of a branch you have, the more transformations you will unlock, and the closer you will be to world domination!"
var t10 ="Good luck! I'll be back later"
var tutorial = [welcome,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10]
var current = 0
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Advisor.play()
	$Label.text = tutorial[current]
	pass # Replace with function body.

func next():
	current +=1
	if current < len(tutorial):
		self.show()
		$Label.text = tutorial[current]
	else:
		current = len(tutorial)
		self.hide()
func prev():
	current -=1
	if current >0:
		self.show()
		$Label.text = tutorial[current]
	else:
		current = -1
		self.hide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("next_message") and !paused:
		next()
		paused = true
		$next_offset.start()
	if Input.is_action_pressed("prev_message") and !paused:
		paused = true
		prev()
		$next_offset.start()
	


func _on_next_offset_timeout():
	paused = false

