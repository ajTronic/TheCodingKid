extends CharacterBody2D

@onready var player = $/root/Game/Player

const SPEED = 100

func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * SPEED
	
	look_at(player.global_position)
	
	move_and_slide()
