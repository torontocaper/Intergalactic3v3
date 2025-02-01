extends TileMapLayer

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		print_debug("You clicked on a tile at position " + str(event.position))
		var grid_position = local_to_map(event.position)
		print_debug("That translates to " + str(grid_position) + " in the tile grid.")
