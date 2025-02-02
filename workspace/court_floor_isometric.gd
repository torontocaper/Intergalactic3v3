extends TileMapLayer

var click_position : Vector2
var local_mouse_position : Vector2
var map_position : Vector2
var polygon_points : Array[Vector2]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		click_position = event.position
		print_debug("You clicked on a tile at position " + str(click_position) + ".")
		
		local_mouse_position = get_local_mouse_position()
		print_debug("That's " + str(local_mouse_position) + " in local mouse position.")
		
		map_position = local_to_map(local_mouse_position)
		print_debug("That translates to " + str(map_position) + " in the tile grid (map position).")

		var clicked_tile_data = get_cell_tile_data(map_position)
		print_debug("Here's the data for that tile: \n" + str(clicked_tile_data))
		
		var surrounding_cells = get_surrounding_cells(map_position)
		print_debug("And here are the surrounding cells: \n" + str(surrounding_cells))
		
		queue_redraw()
		
		
func _ready() -> void:
	var used_tiles = get_used_cells()
	print_debug(used_tiles)

func _draw() -> void:
	polygon_points = [
		Vector2(map_to_local(map_position).x + 16, map_to_local(map_position).y),
		Vector2(map_to_local(map_position).x, map_to_local(map_position).y + 8),
		Vector2(map_to_local(map_position).x -16, map_to_local(map_position).y),
		Vector2(map_to_local(map_position).x, map_to_local(map_position).y - 8)
	]
	draw_colored_polygon(PackedVector2Array(polygon_points), Color.WHITE)
