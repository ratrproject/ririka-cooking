extends Control

signal open

# Called when the node enters the scene tree for the first time.
func _ready():
	var inventory = get_node_or_null ('Inventory')
	if inventory != null:
		for n in range(10):
			var shop_item = preload("res://Nodes/shop_item.tscn")
			var weiner = preload("res://Food/weiner.tscn")
		
			var shop_obj = shop_item.instantiate()
			var food = weiner.instantiate()
		
			shop_obj.add_child(food)
			inventory.add_child(shop_obj)
			shop_obj.texture_normal = food.icon
			shop_obj.foodName = food.foodName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _open():
	self.visible = true
	
func _close():
	self.visible = false
