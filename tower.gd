extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = ProjectSettings.get_setting("display/window/size/viewport_width") / 2
	position.y = ProjectSettings.get_setting("display/window/size/viewport_height") / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
