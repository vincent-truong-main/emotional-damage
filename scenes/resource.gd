extends RigidBody2D

var available = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerMakeActive.one_shot = true
	$AnimatedSprite2D.play("depleted")
	$TimerMakeActive.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_timer_make_active_timeout():
	$AnimatedSprite2D.play("active")
	available = true

func resource_gathered():
	if available == true:
		available = false
		$AnimatedSprite2D.play("depleted")
		$TimerMakeActive.start()
		return true
	return false

func _on_area_2d_body_entered(body):
	print("resource collision")
	if available == true:
		available = false
		$AnimatedSprite2D.play("depleted")
		$TimerMakeActive.start()
		return 1
	return 0
