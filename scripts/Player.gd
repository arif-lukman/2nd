extends KinematicBody2D

const SPD_MUL = 0.03
const MAX_DIST = 400
const ROT_MUL = 0.05
const MAX_ROT = 15

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	#jalan
	var mouse_pos = get_viewport().get_mouse_pos()
	var my_pos = self.get_pos()
	var speed_x = (mouse_pos.x - my_pos.x)*SPD_MUL
	var speed_y = (mouse_pos.y - my_pos.y)*SPD_MUL
	var vector = Vector2(speed_x, speed_y)
	#print(str(vector))
	my_pos += vector
	self.set_pos(my_pos)
	
	#muter
	var degree = rad2deg(self.get_rot())
	var dist_x = (mouse_pos.x - my_pos.x)
	var dist_y = (mouse_pos.y - my_pos.y)
	var dist = Vector2(dist_x, dist_y).length()
	#print(str(vector1))
	var incr = min(dist, MAX_DIST)
	var rot_incr = min(incr * ROT_MUL, MAX_ROT)
	degree -= rot_incr
	self.set_rot(deg2rad(degree))