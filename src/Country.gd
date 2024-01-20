extends Node2D

@export var population: int = 100000
var DIFF_MOD = 1
var aware = 0
var followers = 0
var actors = 0
var e = 2.71828
func sigmoid_test():
	var percent_believers = float(aware + followers + actors)/float(population)
	var i = 10*(percent_believers-.5)
	var sigmoid = 1/(1+pow(e,-1*i))
	var effectiveness = sigmoid*(1-sigmoid)*4
	return effectiveness

func calculate_population_change(spotlight,aesthetics,control):
	var non_believers = population - (aware + followers + actors)
	var effectiveness = sigmoid_test()
	var new_aware =  non_believers * spotlight/100 * effectiveness * DIFF_MOD
	print(new_aware)
	aware += new_aware
	var non_followers = aware - (followers + actors)
	var new_followers = non_followers * aesthetics/100 * effectiveness * DIFF_MOD
	print(new_followers)
	aware -= new_followers
	followers += new_followers
	
	var non_actors = followers - actors
	var new_actors = non_actors * control/100 * effectiveness * DIFF_MOD
	print(new_followers)
	followers -= new_actors
	actors += new_actors
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	print(sigmoid_test())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/GridContainer/AwareVal.text = str(int(aware))
	$Panel/GridContainer/FollowersVal.text = str(int(followers))
	$Panel/GridContainer/ActorVal.text = str(int(actors))
	pass

func calculate_believers():
	pass
	
