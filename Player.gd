##############################
###	Kawaii Positive Genius ###
##############################

extends Node2D

@export var money = 20
@export var startingWage = 20
@export var health = 100
@export var mutation = 0
@export var currentDay = 1

@export var neededCalories = 1500
@export var overEatCalories = 2500
@export var hungerHealthDrain = 0.25
@export var overEatHealthDrain = 0.25
@export var healthRestore = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _advance_day():
	if currentDay % 7 == 0:
		money += 20
	currentDay += 1

func _on_purchase(price):
	money -= price;

func _adjust_health(calories, nutrition):
	if (calories < neededCalories):
		health -= (neededCalories - calories) * hungerHealthDrain
	elif (calories > overEatHealthDrain):
		health -= (calories - overEatHealthDrain) * hungerHealthDrain
	else:
		health += healthRestore
		
	return health > 0
