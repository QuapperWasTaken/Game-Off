extends CharacterBody2D

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x >= $"/root/main/Tower".position.x:
		position.x -= speed
	else:
		position.x += speed
	if position.y >= $"/root/main/Tower".position.y:
		position.y -= speed
	else:
		position.y += speed
