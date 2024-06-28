########################
###	Day Results Menu ###
########################

extends Control

signal day_advanced
@export var box : Control

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
	label.text = 'DAY ' + str(ririka.currentDay+1)
	
	var calories = 0
	var nutrition = 0
	
	var bowl = get_node_or_null ('/root/Base/Main/Bowl/BowlContents')
	for B in bowl.get_children():
		for F in B.get_children():
			calories += F.calories
			nutrition += F.nutrition

	ririka._adjust_health(calories, nutrition)
	
	var calorieTotal = get_node_or_null ('Summary/CaloriesTotal')
	var nutritionTotal = get_node_or_null ('Summary/NutritionTotal')
	var healthTotal = get_node_or_null ('Summary/HealthTotal')
	
	calorieTotal.text = str(calories)
	nutritionTotal.text = str(nutrition)
	healthTotal.text = str(int(ririka.health))
	
	var day = (ririka.currentDay % 7) + 1;
	var dayObject = get_node_or_null ('DayGrid/' + str(day));
	box.reparent(dayObject)
	box.set_position(Vector2(-6.5, 0))
	
	var wage = get_node_or_null ('Wage')
	if day == 7:
		wage.visible = true
		var wageLoss = ririka.wageDecrease * (int((ririka.currentDay + 1) / 7) - 1)
		var money = ririka.startingWage - wageLoss
		wage.text = '+$' + str(money)
		pass
	else:
		wage.visible = false
	
	
	var audio = get_node("AudioStreamPlayer2D")
	audio.play()
	
func _close():
	self.visible = false
	var mainScreen = get_node_or_null ('/root/Base/Main')
	
	emit_signal('day_advanced')
		
	mainScreen.visible = true
