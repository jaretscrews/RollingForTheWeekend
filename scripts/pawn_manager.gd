extends Node

var units = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		units.append(child)
		print(child)
	pass # Replace with function body.

func get_pawn(position):
	for pawn in units:
		if pawn.position == position:
			return pawn