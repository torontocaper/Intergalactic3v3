extends TileMapLayer

signal clicked

var polygon_points : PackedVector2Array
@onready var map_position : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		map_position = local_to_map(get_local_mouse_position())
		print_debug("You clicked on a tile at position " + str(map_position) + " in the tile grid.")
		polygon_points = PackedVector2Array([
			Vector2(map_to_local(map_position).x + 16, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y + 8),
			Vector2(map_to_local(map_position).x -16, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y - 8)
		])
		print_debug("Drawing polygon with points " + str(polygon_points))
		clicked.emit(polygon_points)
