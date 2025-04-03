extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
const GRAVITY = 4000

var holdYData = Vector2.ZERO
var attackAnims = ["attack1", "attack2", "attack3"]
var isAttacking
var randAttack

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_pressed("attack"):
		isAttacking = true
		randAttack = attackAnims[randi() % attackAnims.size()]
	elif isAttacking == true:
		$AnimatedSprite2D.play(randAttack)
	else:
		$AnimatedSprite2D.play("idle")
		

func _physics_process(delta):
	get_input()
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AnimatedSprite2D.play("jump")
	elif not is_on_floor() and velocity.y > JUMP_VELOCITY - -800:
		$AnimatedSprite2D.play("fall")

	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	isAttacking = false
