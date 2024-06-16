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
	if inventory != null:
		for n in inventory.get_children():
			inventory.remove_child(n)
			n.queue_free()
		
		for n in range(10):
			var shop_item = preload("res://Nodes/shop_item.tscn")
			var weiner = preload("res://Food/weiner.tscn")
		
			var shop_obj = shop_item.instantiate()
			var food = weiner.instantiate()
		
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
