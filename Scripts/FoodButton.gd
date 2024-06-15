extends TextureButton

@export var foodName = ""

signal food_added

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var food_node = get_node_or_null (foodName)
	if food_node == null:
		queue_free()

func _on_pressed():
	var food_node = get_node_or_null (foodName)
	if food_node != null:
		print(food_node.calories)
		emit_signal('food_added',food_node)
