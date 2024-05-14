extends CharacterBody2D

signal resource_gathered

@export var speed = 400
var screen_size
var resources = 3
@export var pos = 0
@export var max_resources = 6


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	pass

func start():
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_area_2d_body_entered(body):
	print("test")
	if body.name == "Resource":
		
		var point = body.resource_gathered()
		print(point)
		if point and resources < max_resources:
			print("resource detected")
			print(resources)
			resources += 1
	else:
		print(body.name)
	pass # Replace with function body.
