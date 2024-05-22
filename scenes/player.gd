extends CharacterBody2D

signal resource_gathered
signal shoot

@export var speed = 400
var screen_size
var resources = 3
@export var pos = 0
@export var max_resources = 6

var can_shoot : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	can_shoot = true
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
	
	if Input.is_action_pressed("shoot") and can_shoot:
		var direction = Input.get_vector("shoot_direction_down", "shoot_direction_left", "shoot_direction_right", "shoot_direction_up")
		shoot.emit(position, direction)
		can_shoot = false
		$ShotTimer.start()
		
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
	

