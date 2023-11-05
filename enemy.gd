extends CharacterBody2D

@export var speed = 5
var health = 10
var type = "enemy"
var currency_drop = 1
var damage = 1
var attack_counter = 0
var attack_rate = 30

func _ready():
	pass # Replace with function body.

func _process(delta):
	attack_counter += 1
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
	else:
		if $"AttackRange".overlaps_area($"/root/main/Tower/TowerHitbox") and attack_counter >= attack_rate:
			$"/root/main/Tower".health -= damage
			attack_counter = 0
			print("tower health: ", $"/root/main/Tower".health)
	
