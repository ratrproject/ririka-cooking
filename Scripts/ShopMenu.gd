###########################
###	Class for food shop ###
###########################

extends Control

signal open

# Called when the node enters the scene tree for the first time.
func _ready():
	_shop_reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ririka = get_node_or_null ('/root/Base/Main/Ririka')
	var label = get_node('/root/Base/ShopMenu/MoneyLabel')
	label.text = '$ ' + str(ririka.money)


func _shop_reset():
	var inventory = get_node_or_null ('Inventory')
	var shop_item = preload("res://Nodes/shop_item.tscn")
	if inventory != null:
		for n in inventory.get_children():
			inventory.remove_child(n)
			n.queue_free()
		
		for n in range(10):
			var rn = randi_range(0,20)
			var food_item = null;
			match rn:
				1,14,15:
					food_item = preload("res://Food/weiner.tscn")
				2,18:
					food_item = preload("res://Food/egg.tscn")
				3:
					food_item = preload("res://Food/brocolli.tscn")
				4:
					food_item = preload("res://Food/cabbage.tscn")
				5:
					food_item = preload("res://Food/chicken.tscn")
				6,16,17:
					food_item = preload("res://Food/expired-weiner.tscn")
				7:
					food_item = preload("res://Food/hardboiled-egg.tscn")
				8:
					food_item = preload("res://Food/harissa.tscn")
				9:
					food_item = preload("res://Food/karaage.tscn")
				10:
					food_item = preload("res://Food/menma.tscn")
				11,19:
					food_item = preload("res://Food/rice.tscn")
				12:
					food_item = preload("res://Food/tako.tscn")
				13:
					food_item = preload("res://Food/tuna.tscn")
				_:
					food_item = preload("res://Food/ramen.tscn")
		
			var shop_obj = shop_item.instantiate()
			var food = food_item.instantiate()
		
			shop_obj.add_child(food)
			inventory.add_child(shop_obj)
			shop_obj.texture_normal = food.icon
			shop_obj.foodName = food.foodName
			shop_obj.price = food.price
			
			var label = shop_obj.get_node("Label")
			label.text = '$ ' + str(food.price)

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
