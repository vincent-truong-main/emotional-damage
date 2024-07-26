extends Node

@export var max_resources = 6
@export var starting_resources = 3
var p1_resources = starting_resources
var p2_resources = starting_resources

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hud/Player1Resources.text = "P1: " + str(p1_resources)
	$Hud/Player2Resources.text = "P2: " + str(p2_resources)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_1_resource_gathered():
	if p1_resources < max_resources:
		p1_resources += 1
	pass # Replace with function body.


func _on_player_2_resource_gathered():
	if p2_resources < max_resources:
		p2_resources += 1
	pass # Replace with function body.



func _on_player_1_shoot(pos, dir):
	if p1_resources > 0:
		p1_resources -= 1
	$Hud/Player1Resources.text = "P1: " + str(p1_resources)
	
	pass # Replace with function body.


func _on_player_2_shoot(pos, dir):
	if p2_resources > 0:
		p2_resources -= 1
	$Hud/Player2Resources.text = "P2: " + str(p2_resources)
	
	pass # Replace with function body.
