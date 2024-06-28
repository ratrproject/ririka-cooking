###################################
### Container for Prepared Food ###
###################################

extends Node2D

var calories = 0;
var nutrients = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_food_added(value):
	var scr = preload("res://Nodes/prepared_food.tscn")
	var food = scr.instantiate()
	var contents = get_node("BowlContents")
	
	#for item in contents.get_children():
	#	if item.name == value.foodName:
	#		var audio = get_node("ErrorSound")
	#		audio.play()
	#		return
	
	contents.add_child(food)
	value.reparent(food)
	food.set_texture(value.cookedImage1)
	food.name = value.foodName
	
	
	calories += value.calories
	var cals = get_node("Calories")
	cals.text = str(calories) + ' cals'
	
	nutrients += value.nutrition
	var nutrition = get_node("Nutrition")
	nutrition.text = str(nutrients) + ' nutrients'
	
	var audio = get_node("AudioStreamPlayer2D")
	audio.play()


func _on_day_results_day_advanced():
	var contents = get_node("BowlContents")
	
	for n in contents.get_children():
		contents.remove_child(n)
		n.queue_free()
	
	calories = 0
	var cals = get_node("Calories")
	cals.text = str(calories) + ' cals'
	
	nutrients = 0
	var nutrition = get_node("Nutrition")
	nutrition.text = str(nutrients) + ' nutrients'
	
