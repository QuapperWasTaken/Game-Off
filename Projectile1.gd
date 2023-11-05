extends CharacterBody2D

var type = "projectile"
var target
@export var damage = 5
@export var speed = 5

func _ready():
	pass # Replace with function body.

func _process(delta):
	if global_position.x >= target.global_position.x:
		position.x -= speed
	else:
		position.x += speed
	if global_position.y >= target.global_position.y:
		position.y -= speed
	else:
		position.y += speed
	
func _on_hitbox_body_entered(body):
	if body == target:
		target.health -= damage + $"/root/main/Tower".damage_upgrades
		print("enemy health: ", target.health)
		queue_free()
