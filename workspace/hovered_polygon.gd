extends Line2D

func _ready() -> void:
	closed = true
	default_color = Color.BLACK
	width = 1.0

func _on_court_floor_isometric_hovered(hovered_polygon_points : PackedVector2Array) -> void:
	points = hovered_polygon_points
