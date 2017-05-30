extends Area2D

func _ready():
	set_process(true)

func _process(delta):
	var acc = Input.get_accelerometer()
	set_gravity_vector(Vector2(-acc.x, -acc.y))