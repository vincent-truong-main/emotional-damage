extends Node

@export var max_resources = 6
@export var starting_resources = 3
var p1_resources = starting_resources
var p2_resources = starting_resources

# Called when the node enters the scene tree for the first time.
func _ready():
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
