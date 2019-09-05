extends Node2D

onready var tile_map = get_parent()

const SIZE_OF_CELL = 32
const MOVEMENT_COOLDOWN = 0.1

var remaing_movement_cooldown = 0

var selected_pawn = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	remaing_movement_cooldown = clamp(remaing_movement_cooldown - delta, 0, MOVEMENT_COOLDOWN)
	
	if Input.is_action_just_pressed("ui_select"):
		if selected_pawn:
			selected_pawn.position = position
			selected_pawn = null
			return
		else:
			var temp_pawn = tile_map.get_tile(position)
			if temp_pawn:
				if temp_pawn.is_controllable():
					selected_pawn = temp_pawn
				else:
					print(temp_pawn)
	
	var input_direction = get_input_direction()
	if input_direction:
		if remaing_movement_cooldown == 0:
			remaing_movement_cooldown = MOVEMENT_COOLDOWN
			var target_position = position + (input_direction * SIZE_OF_CELL)
			set_position(target_position)

# Get the input direction from the player
func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)