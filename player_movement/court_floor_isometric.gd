extends TileMapLayer

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		var click_position = event.position
		print_debug("You clicked on a tile at position " + str(click_position))
		
		var local_mouse_position = get_local_mouse_position()
		print_debug("That's " + str(local_mouse_position) + " in local mouse position.")
		
		var map_position = local_to_map(local_mouse_position)
		print_debug("That translates to " + str(map_position) + " in the tile grid (map position).")


func _ready() -> void:
	var used_tiles = get_used_cells()
	print_debug(used_tiles)
	
