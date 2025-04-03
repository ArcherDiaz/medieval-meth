extends RigidBody2D

var min_speed = 150
var max_speed = 200

func _ready():
	$AnimatedSprite2D.play()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
