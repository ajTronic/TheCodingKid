extends Area2D

@export var IS_HAZARD = false

func _on_body_entered(body):
	if body.has_meta("tag") and body.get_meta("tag") == "player":
		if IS_HAZARD:
			get_tree().get_root().get_node("Game/Player").die()
			await get_tree().create_timer(1).timeout
		GameTimer.startTime = Time.get_ticks_msec()
		get_tree().reload_current_scene()

