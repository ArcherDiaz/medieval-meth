extends CharacterBody2D

var speed = 50
var gravity = 1
var direction = Vector2.RIGHT 

func _ready():
	$AnimatedSprite2D.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _physics_process(delta):
	velocity = direction * speed 
	move_and_slide()
