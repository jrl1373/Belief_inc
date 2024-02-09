extends Node2D

@export var population: int = 100000
var DIFF_MOD = .4
var aware = 0
var followers = 0
var actors = 0
var leftovers = population
var e = 2.71828
signal new_actors(new_actors)
signal win
func sigmoid_test(percent_complete):
	var i = 10*(percent_complete-.5)
	var sigmoid = 1/(1+pow(e,-1*i))
	var effectiveness = sigmoid*(1-sigmoid)*4
	return effectiveness

func calculate_population_change(spotlight,aesthetics,control):
	var non_believers = population - (aware + followers + actors)
	var effectiveness = sigmoid_test(float(aware + followers + actors)/float(population))
	var new_aware =  max(0,non_believers * spotlight/100 * effectiveness * DIFF_MOD)

	aware += new_aware
	leftovers -= new_aware
	var non_followers = aware - (followers + actors)
	effectiveness = sigmoid_test(float(aware-non_followers)/float(aware))
	var new_followers =  max(0,non_followers * aesthetics/100 * effectiveness * DIFF_MOD)

	aware -= new_followers
	followers += new_followers
	var non_actors = followers - actors
	effectiveness = sigmoid_test(float(followers-non_actors)/float(followers))
	var new_actor_val = max(0,non_actors * control/100 * effectiveness * DIFF_MOD)

	followers -= new_actor_val
	actors += new_actor_val
	new_actors.emit(new_actor_val)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if int(leftovers) <= 0:
		win.emit()
	$GridContainer/PopVal.text = str(int(leftovers))
	$GridContainer/AwareVal.text = str(int(aware))
	$GridContainer/FollowersVal.text = str(int(followers))
	$GridContainer/ActorVal.text = str(int(actors))
	pass

func calculate_believers():
	pass
	
