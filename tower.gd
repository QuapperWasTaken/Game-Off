extends StaticBody2D


var fire_counter = 0
var fire_rate = 60
var target_list = []
var type = "tower"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = ProjectSettings.get_setting("display/window/size/viewport_width") / 2
	position.y = ProjectSettings.get_setting("display/window/size/viewport_height") / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fire_counter += 1
	
	if target_list.size() > 0 and fire_counter >= fire_rate:
		var projectile_1 = preload("res://projectile_1.tscn").instantiate()
		projectile_1.target = target_list[0]
		add_child(projectile_1)
		fire_counter = 0
	#Get enemy position
	#Shoot projectile_1 towards an enemy
	#Deal damage to the enemy
	
func _on_tower_range_body_entered(body):
	if body.type == "enemy":
		target_list.push_back(body)
		
func _on_tower_range_body_exited(body):
	target_list.erase(body)
	pass # Replace with function body.
