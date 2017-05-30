extends KinematicBody2D

const MAX_ROT = 100
const MAX_TIME = 0.3
const MIN_ASPD_RATE = 0.05
const BULLET = preload("res://instances/Bullet.tscn")
const BULLET_SPD = 1500
var time = 0.0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var rotation_before = rad2deg(get_rot())
	var rotation_after = - rad2deg(get_parent().get_parent().get_rot())
	set_rot(deg2rad(rotation_after))
	
	var rotate = min(rotation_after - rotation_before, MAX_ROT)
	#print(str(rotate))
	var aspd_rate = 1 - ((rotate/MAX_ROT) * 1)
	#print(str(aspd_rate))
	var aspd = max(aspd_rate * MAX_TIME, MIN_ASPD_RATE)
	if(aspd >= 0.29):
		aspd = 0
	time += delta
	if(time>=aspd && aspd != 0):
		time-=aspd
		var bullet = BULLET.instance()
		bullet.set_pos(get_global_pos())
		var bullet_direction = self.get_global_pos() - get_parent().get_parent().get_global_pos()
		var velocity = bullet_direction.normalized()*BULLET_SPD
		#print(str(velocity))
		bullet.set_linear_velocity(velocity)
		get_tree().get_root().add_child(bullet)
	
	#print(str(time))
	#print(str(can_shoot))
	#print(str(aspd))