extends Control

func _open():
	var mainScreen = get_node_or_null ('/root/Base/Main')
	mainScreen.visible = false
	
	var dayResults = get_node_or_null ('/root/Base/DayResults')
	dayResults.visible = false
	
	self.visible = true
	
	var ririka = get_node_or_null ('/root/Base/Main/Ririka')

	var label = get_node_or_null ('SurviveCounter')
	label.text = 'SURVIVED ' + str(ririka.currentDay+1) +  ' DAYS'

	var audio = get_node("AudioStreamPlayer2D")
	audio.play()

func _restart():
	get_tree().reload_current_scene()
