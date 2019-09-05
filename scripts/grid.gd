extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_tile(tile_world_position):
	var tile_local_position = world_to_map(tile_world_position)
	var tile = get_cellv(tile_local_position)
	return tile