extends Area2D

var direction : Vector2
var speed :int = 500

func _process(delta):
	position += speed * delta * direction
