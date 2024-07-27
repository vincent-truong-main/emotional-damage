extends Node2D

@export var bullet_scene : PackedScene
@export var player_size : int

func calculate_bullet_spawn(pos, dir):
	# characters are 100x100 currently, run calculation to figure out how far vertically and horizontally to teleport bullet
	var size = player_size / 2
	var bullet_size = 10
	if(abs(dir.x) >= abs(dir.y)):
		if(dir.x < 0 ):
			pos.x += -size - bullet_size
		else:
			pos.x += size + bullet_size
		pos.y += (size / abs(dir.x)) * dir.y
		if(dir.y < 0):
			pos.y -= bullet_size
		else:
			pos.y += bullet_size
	elif(abs(dir.y) > abs(dir.x)):
		if(dir.y < 0 ):
			pos.y += -size - bullet_size
		else:
			pos.y += size + bullet_size
		pos.x += (size / abs(dir.y)) * dir.x
		if(dir.x < 0):
			pos.x -= bullet_size
		else:
			pos.x += bullet_size
	return pos

func _on_player_1_shoot(pos, dir):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position = calculate_bullet_spawn(pos, dir)
	bullet.direction = dir.normalized()
	bullet.add_to_group("bullets")

func _on_player_2_shoot(pos, dir):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position = calculate_bullet_spawn(pos, dir)
	bullet.direction = dir.normalized()
	bullet.add_to_group("bullets")
