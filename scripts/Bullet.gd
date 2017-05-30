extends RigidBody2D

func _ready():
	set_process(true)

func _process(delta):
	if (get_pos().x > get_viewport_rect().end.x || get_pos().y > get_viewport_rect().end.y || get_pos().y < 0 || get_pos().x < 0):
		#print("Ball died")
		#buat ngancurin node
		queue_free()