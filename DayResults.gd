########################
###	Day Results Menu ###
########################

extends Control

signal day_advanced

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _open():
	self.visible = true
	var mainScreen = get_node_or_null ('/root/Base/Main')
	mainScreen.visible = false
	
	var ririka = get_node_or_null ('/root/Base/Main/Ririka')
	var label = get_node('Label')
	label.text = 'DAY ' + str(ririka.currentDay)
	
func _close():
	self.visible = false
	var mainScreen = get_node_or_null ('/root/Base/Main')
	
	emit_signal('day_advanced')
		
	mainScreen.visible = true
