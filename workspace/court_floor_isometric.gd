extends TileMapLayer

signal clicked
signal hovered

var clicked_polygon_points : PackedVector2Array
var map_position : Vector2
@export var hover_polygon_points : PackedVector2Array

func _process(_delta: float) -> void:
	var hover_position_local := get_local_mouse_position()
	var hover_position_map := local_to_map(hover_position_local)
	hover_polygon_points = PackedVector2Array([
		Vector2(map_to_local(hover_position_map).x + 16, map_to_local(hover_position_map).y),
		Vector2(map_to_local(hover_position_map).x, map_to_local(hover_position_map).y + 8),
		Vector2(map_to_local(hover_position_map).x -16, map_to_local(hover_position_map).y),
		Vector2(map_to_local(hover_position_map).x, map_to_local(hover_position_map).y - 8),
		Vector2(map_to_local(hover_position_map).x + 16, map_to_local(hover_position_map).y),
	])
	hovered.emit(hover_polygon_points)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		map_position = local_to_map(get_local_mouse_position())
		print_debug("You clicked on a tile at position " + str(map_position) + " in the tile grid.")
		clicked_polygon_points = PackedVector2Array([
			Vector2(map_to_local(map_position).x + 16, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y + 8),
			Vector2(map_to_local(map_position).x -16, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y - 8)
		])
		print_debug("Drawing polygon with points " + str(clicked_polygon_points))
		clicked.emit(clicked_polygon_points)
