extends StaticBody2D

var fire_counter = 0 #starts the countdown to shoot, can shoot when >= fire_rate
var fire_rate = 60
var target_list = [] #enemies added to this list dynamically
var type = "tower"
var currency = 0
var damage_upgrades = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = ProjectSettings.get_setting("display/window/size/viewport_width") / 2
	position.y = ProjectSettings.get_setting("display/window/size/viewport_height") / 2
	#centers the tower on screen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fire_counter += 1 #counts up to shoot
	
	if target_list.size() > 0 and fire_counter >= fire_rate: #checks if tower has a target, and is ready to fire
		var projectile_1 = preload("res://projectile_1.tscn").instantiate()
		projectile_1.target = target_list[0] #sets projectile_1's target to earliest entry
		add_child(projectile_1) #adds projectile
		fire_counter = 0 #resets counter
	
func _on_tower_range_body_entered(body):
	if body.type == "enemy":
		target_list.push_back(body)
		
func _on_tower_range_body_exited(body):
	if body.type == "enemy" and body.health <= 0:
		currency += body.currency_drop
		target_list.erase(body)
		print("money:", currency)
		
func _button_pressed(upgrade_button):
	if currency < upgrade_button.price:
		print("you need ", upgrade_button.price, " but you only have ", currency)
	else:
		currency -= upgrade_button.price
		upgrade_button.price += 1
		damage_upgrades += 1
		print("damage upgrades:", damage_upgrades, ", money:", currency)
