extends CharacterBody2D

@export var SPEED = 10400
@export var JUMP_VELOCITY = -32000
@export var START_GRAVITY = 1700
@export var COYOTE_TIME = 140 # in ms
@export var JUMP_BUFFER_TIME = 100 # in ms
@export var JUMP_CUT_MULTIPLIER = 0.4
@export var AIR_HANG_MULTIPLIER = 0.95
@export var AIR_HANG_THRESHOLD = 50
@export var Y_SMOOTHING = 0.8
@export var AIR_X_SMOOTHING = 0.10
@export var MAX_FALL_SPEED = 25000

@onready var sprite: AnimatedSprite2D = $"AnimatedSprite2D"
@onready var animPlayer: AnimationPlayer = $"AnimationPlayer"

enum States {
	IDLE,
	RUN,JUMP,
	AIR,
	DEAD,
}

@onready var state: States = States.AIR
var prevVelocity = Vector2.ZERO
var lastFloorMsec = 0
var wasOnFloor = false
var lastJumpQueueMsec: int
var gravity = START_GRAVITY

func _ready():
	set_meta("tag", "player")

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor():
		lastFloorMsec = Time.get_ticks_msec()
	elif state != States.JUMP and state != States.AIR and state != States.DEAD:
		state = States.AIR
		sprite.play("fall")
	
	match state:
		States.JUMP:
			velocity.y = JUMP_VELOCITY * delta
			sprite.play("jump")
			animPlayer.stop()
			animPlayer.play("jump")
			state = States.AIR
		States.AIR:
			if is_on_floor():
				state = States.IDLE
				animPlayer.play("land")
			if Input.is_action_just_released("jump"):
				velocity.y *= JUMP_CUT_MULTIPLIER
			run(direction, delta)
			velocity.x = lerp(prevVelocity.x, velocity.x, AIR_X_SMOOTHING)
			if Input.is_action_just_pressed("jump"):
				if Time.get_ticks_msec() - lastFloorMsec < COYOTE_TIME:
					state = States.JUMP
				else:
					lastJumpQueueMsec = Time.get_ticks_msec()
			velocity.y += gravity * delta
			if abs(velocity.y) < AIR_HANG_THRESHOLD:	
				gravity *= AIR_HANG_MULTIPLIER
				print(velocity.y)
			else:
				gravity = START_GRAVITY
#			if velocity.y > 0:
#				GRAVITY = 2000
#			else:
#				GRAVITY = 1500
		States.IDLE:
			if Time.get_ticks_msec() - lastJumpQueueMsec < JUMP_BUFFER_TIME or Input.is_action_just_pressed("jump"): # jump buffer
				state = States.JUMP
			else:
				velocity.x = 0
				sprite.scale.x = 1
				sprite.play("idle")
				if direction != 0:
					state = States.RUN
		States.RUN:
			sprite.play("run")
			run(direction, delta)
			
			if direction == 0:
				state = States.IDLE
			elif Input.is_action_just_pressed("jump"): 
				state = States.JUMP
		States.DEAD:
			pass

	velocity.y = lerp(prevVelocity.y, velocity.y, Y_SMOOTHING)
	
	velocity.y = min(velocity.y, MAX_FALL_SPEED * delta)
	
	wasOnFloor = is_on_floor()
	prevVelocity = velocity
	
	move_and_slide()
	
	
func run(direction, delta):
	velocity.x = SPEED * direction * delta
	if not direction == 0:
		sprite.flip_h = direction < 0
	
func die():
	state = States.DEAD
	velocity.x = 0
	velocity.y = 0
	sprite.stop()
	sprite.play("dead")
