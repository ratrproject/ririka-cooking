##############################
###	Kawaii Positive Genius ###
##############################

extends Node2D

@export var money = 20
@export var startingWage = 20
@export var health = 100
@export var mutation = 0
@export var currentDay = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _advance_day():
	if currentDay % 7 == 0:
		money += 20
	currentDay += 1
