extends TextureButton

signal shop_purchase

var purchased = false;
@export var foodName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var inventory_node = get_node_or_null("/root/Node2D/Inventory/Inventory")
	if inventory_node != null:
		self.shop_purchase.connect(inventory_node._on_food_added)

	pass # Replace with function body.

func _on_pressed():
	var food_node = get_node_or_null(foodName)
	if food_node != null and purchased == false:
		emit_signal('shop_purchase',food_node)
		purchased = true
		self.modulate = '#888888';
