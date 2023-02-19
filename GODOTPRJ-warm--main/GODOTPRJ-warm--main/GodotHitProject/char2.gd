#обычные переменные
var lin_vel = Vector2(0, 0)
onready var sprite = get_node("Sprite")

#константы
const SPEED = 200
const GRAVITY = 200
const UP = Vector2(0, -1)
const JUMP_SPEED = 2000

#функции
func _physics_process(delta):
  apply_gravity()
  jump()
  move()
  move_and_slide(lin_vel, UP)
  animate()

func apply_gravity():
  if is_on_floor():
   lin_vel.y = 0
  else:
   lin_vel.y += GRAVITY
  
func jump():
  if Input.is_action_pressed("jump") and is_on_floor():
	lin_vel.y -= JUMP_SPEED
  
func move():
  if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
	lin_vel.x = -SPEED
  elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
	lin_vel.x = SPEED
  else:
	lin_vel.x = 0
	
func animate():
  if lin_vel.y < 0:
	sprite.play(idle)
  elif lin_vel.x > 0:
	sprite.play(run)
	sprite.flip_h = false
  elif lin_vel.x < 0:
	sprite.play(run)
	sprite.flip_h = true
  else:
	sprite.play(idle)


