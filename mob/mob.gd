extends CharacterBody2D

var speed = 300
var gravity = 500
var direction = Vector2.RIGHT 

func _ready():
	$AnimatedSprite2D.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	$AnimatedSprite2D.flip_h = true
	direction = Vector2.LEFT
	#queue_free()
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = direction.x * speed
	move_and_slide()
