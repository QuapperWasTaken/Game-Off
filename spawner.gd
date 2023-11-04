extends Node2D

var spawn_timer = 120 #dictates delay between spawns
var counter = 0 #when this number reaches spawn_timer, do a spawn
var minimum_spawn_range = 200
var maximum_spawn_range = 500

func _ready():
	counter = 120

func _process(delta):
	counter += 1
	if counter >= spawn_timer:
		var enemy = preload("res://enemy.tscn").instantiate() #instantiate makes each enemy have a unique name
		var tower_position_x = $"/root/main/Tower".position.x #fetches tower x position
		var tower_position_y = $"/root/main/Tower".position.y #fetches tower y position
		var mod_x = 1 #allows x spawn to also be from other side of tower
		var mod_y = 1 #same but with y
		randomize()
		if randf_range(0, 1) > 0.5:
			mod_x = -1
		randomize()
		if randf_range(0, 1) > 0.5:
			mod_y = -1
		randomize()
		enemy.position.x = tower_position_x - randi_range(minimum_spawn_range, maximum_spawn_range) * mod_x #selects a random position between minimum and maximum range and multiplies it by mod
		randomize()
		enemy.position.y = tower_position_y - randi_range(minimum_spawn_range, maximum_spawn_range) * mod_y #same as above for y
		add_child(enemy) #spawns an enemy
		counter = 0 #resets the timer
