###############################
###	Inventory of food items ###
###############################

extends GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_food_added(value):
	var scr = preload("res://Nodes/food_item.tscn")
	var food = scr.instantiate()
	self.add_child(food)
	value.reparent(food)
	food.texture_normal = value.icon
	food.foodName = value.foodName
	
	var cals = food.get_node("Calories")
	cals.text = str(value.calories) + ' cals'
	
	var nutrition = food.get_node("Nutrition")
	nutrition.text = str(value.nutrition) + ' nutrients'
