class_name Character
extends CharacterBody2D


@export var color : String = ""
@export var imposter : bool = false
@export var order : int = 0;

func _ready():
	pass
	

func set_up(c: String, i: bool, o: int):
	color = c
	imposter = i
	order = o
