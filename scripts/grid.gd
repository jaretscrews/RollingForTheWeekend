extends TileMap

onready var friendly_units = get_node("Friendly Units")
onready var enemy_untis = get_node("Enemy Units")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_tile(tile_world_position):
	var tile_local_position = world_to_map(tile_world_position)
	var tile = get_cellv(tile_local_position)
	
	var friendly = friendly_units.get_pawn(tile_world_position)
	if friendly:
		return friendly
	
	var enemy = enemy_untis.get_pawn(tile_world_position)
	if enemy:
		return enemy
	
	return null