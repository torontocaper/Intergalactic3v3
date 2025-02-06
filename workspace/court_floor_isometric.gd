extends TileMapLayer

signal clicked
signal hovered

var clicked_polygon_points : PackedVector2Array
var hover_position_map : Vector2
var click_position_map : Vector2
@export var hover_polygon_points : PackedVector2Array

func _process(_delta: float) -> void:
	hover_position_map = local_to_map(get_local_mouse_position())
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
		click_position_map = local_to_map(get_local_mouse_position())
		print_debug("You clicked on a tile at position " + str(click_position_map) + " in the tile grid.")
		clicked_polygon_points = PackedVector2Array([
			Vector2(map_to_local(click_position_map).x + 16, map_to_local(click_position_map).y),
			Vector2(map_to_local(click_position_map).x, map_to_local(click_position_map).y + 8),
			Vector2(map_to_local(click_position_map).x -16, map_to_local(click_position_map).y),
			Vector2(map_to_local(click_position_map).x, map_to_local(click_position_map).y - 8)
		])
		print_debug("Drawing polygon with points " + str(clicked_polygon_points))
		clicked.emit(clicked_polygon_points)
