#######################################
###	Generic class for items in shop ###
#######################################

extends TextureButton

signal shop_purchase

var purchased = false;
@export var foodName = ""
@export var price = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var inventory_node = get_node_or_null("/root/Base/Main/Inventory/ScrollContainer/Inventory")
	if inventory_node != null:
		self.shop_purchase.connect(inventory_node._on_food_added)
	
	
func _on_pressed():
	var ririka_node = get_node_or_null("/root/Base/Main/Ririka")
	var food_node = get_node_or_null(foodName)
	if food_node != null and ririka_node != null and purchased == false:
		if price <= ririka_node.money: 
			emit_signal('shop_purchase',food_node)
			ririka_node._on_purchase(price)
			purchased = true
			self.modulate = '#888888';
			var audio = get_node("AudioStreamPlayer2D")
			audio.play()
			
