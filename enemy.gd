extends CharacterBody2D

@export var speed = 5
var health = 10
var type = "enemy"
var currency_drop = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x >= $"/root/main/Tower".global_position.x:
		position.x -= speed
	else:
		position.x += speed
	if global_position.y >= $"/root/main/Tower".global_position.y:
		position.y -= speed
	else:
		position.y += speed
	if health <= 0:
		queue_free()
