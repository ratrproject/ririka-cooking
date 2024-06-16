###################################
### Container for Prepared Food ###
###################################

extends Node2D

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
	
	contents.add_child(food)
	value.reparent(food)
	food.set_texture(value.cookedImage1)


func _on_day_results_day_advanced():
	var contents = get_node("BowlContents")
	
	for n in contents.get_children():
		contents.remove_child(n)
		n.queue_free()
