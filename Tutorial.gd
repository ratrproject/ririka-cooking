extends Control

func _close():
	self.visible = false
	var mainScreen = get_node_or_null ('/root/Base/Main')
	mainScreen.visible = true
	
