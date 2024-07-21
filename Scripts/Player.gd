##############################
###	Kawaii Positive Genius ###
##############################

extends Node2D

@export var money = 100
@export var startingWage = 20
@export var wageDecrease = 5
@export var health = 100
@export var mutation = 0
@export var currentDay = 0

@export var neededCalories = 1500
@export var overEatCalories = 2500
@export var hungerHealthDrain = 0.25
@export var overEatHealthDrain = 0.25
@export var healthRestore = 5

@export var neededNutrition = 100
@export var greatNutrition = 100
@export var nutritionHealthDrain = 0.25
@export var nutritionHealthRestore = 5

signal is_dead

# Called when the node enters the scene tree for the first time.
func _ready():
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _advance_day():
	currentDay += 1
	if currentDay % 7 == 0:
		var wageLoss = wageDecrease * (int(currentDay / 7) - 1)
		money += startingWage - wageLoss

func _on_purchase(price):
	money -= price;

func _adjust_health(calories, nutrition):
	if (calories < neededCalories):
		health -= (neededCalories - calories) * hungerHealthDrain
	elif (calories > overEatCalories):
		health -= (calories - overEatHealthDrain) * hungerHealthDrain
	else:
		health = min(health + healthRestore, 100)

	if (nutrition < neededNutrition):
		health -= (neededNutrition - nutrition) * nutritionHealthDrain
	elif (nutrition > greatNutrition):
		health = min(health + nutritionHealthRestore, 100)
	
	
	
	if health <= 0:
		emit_signal('is_dead')
		
	return health > 0
