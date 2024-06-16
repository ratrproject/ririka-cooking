###########################
###	Class for food shop ###
###########################

extends Control

signal open

# Called when the node enters the scene tree for the first time.
func _ready():
	_shop_reset()

func _shop_reset():
	var inventory = get_node_or_null ('Inventory')
	var shop_item = preload("res://Nodes/shop_item.tscn")
	if inventory != null:
		for n in inventory.get_children():
			inventory.remove_child(n)
			n.queue_free()
		
		for n in range(10):
			var rn = randi_range(0,1)
			var food_item = null;
			match rn:
				1:
					food_item = preload("res://Food/weiner.tscn")
				_:
					food_item = preload("res://Food/ramen.tscn")
		
			var shop_obj = shop_item.instantiate()
			var food = food_item.instantiate()
		
			shop_obj.add_child(food)
			inventory.add_child(shop_obj)
			shop_obj.texture_normal = food.icon
			shop_obj.foodName = food.foodName

func _open():
	self.visible = true
	var mainScreen = get_node_or_null ('/root/Base/Main')
	mainScreen.visible = false
	
func _close():
	self.visible = false
	var mainScreen = get_node_or_null ('/root/Base/Main')
	mainScreen.visible = true


func _on_day_results_day_advanced():
	_shop_reset()
