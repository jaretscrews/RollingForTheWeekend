extends Node2D

export(String) var unit_name = "Pawn"
export(bool) var controllable = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func is_controllable():
	return controllable

func get_class(): 
	return unit_name