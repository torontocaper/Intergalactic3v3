extends Node2D

var polygon_points : PackedVector2Array

func _draw() -> void:
	if polygon_points:
		draw_polyline(polygon_points, Color.BLACK, 1.0)

func _on_court_floor_isometric_hovered(hovered_polygon_points : PackedVector2Array) -> void:
	polygon_points = hovered_polygon_points
	queue_redraw()
