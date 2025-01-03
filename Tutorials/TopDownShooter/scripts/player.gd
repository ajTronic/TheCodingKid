extends CharacterBody2D

var bullet_scene = preload("res://scenes/bullet.tscn")
const SPEED = 200
@onready var is_reloading = false
@onready var shooty_part = $ShootyPart

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())

	velocity.x = Input.get_axis("left", "right") * SPEED
	velocity.y = Input.get_axis("up", "down") * SPEED
	velocity = lerp(get_real_velocity(), velocity, 0.1)
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = shooty_part.global_position
		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		$/root/Game.add_child(bullet)

	move_and_slide()

	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
	
		if collision.get_collider().is_in_group("enemies") and not is_reloading:
			is_reloading = true
			get_tree().reload_current_scene()
