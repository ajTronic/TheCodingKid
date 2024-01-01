extends Line2D

@export var SIZE: int
@export var SMOOTHING: float
@onready var curve := Curve2D.new()

func _on_timer_timeout():
	if curve.get_baked_points().size() > SIZE:
		curve.remove_point(0)	
	else:
		if curve.get_baked_points().size() > 0:
			curve.add_point(
				lerp(
					curve.get_baked_points()[curve.get_baked_points().size()-1],
					get_parent().get_global_position(),
					SMOOTHING
				)
			)
		else:
			curve.add_point(get_parent().get_global_position())
	points = curve.get_baked_points()
