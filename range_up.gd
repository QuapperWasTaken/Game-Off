extends Button

var price = 1
var upgrade = "range"

func _ready():
	connect("pressed", Callable($"/root/main/Tower", "_button_pressed").bind(self))
