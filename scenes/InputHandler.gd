extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	# print(event.as_text())
	if event.is_action_pressed("move_down"):
		print("Device: " + str(event.device))
		dispatch_event(event.device, "move_down")
	pass

func dispatch_event(player_device, action):
	if(player_device == 0):
		player_1.handle_input(action)
	pass
	
