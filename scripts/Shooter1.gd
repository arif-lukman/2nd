extends KinematicBody2D

#variabel
var time = 0.0

#konstanta
#instans peluru
const BULLET = preload("res://instances/Bullet.tscn")
#rotasi maksimum dalam derajat
const MAX_ROT = 30
#waktu maksimum untuk minimum kecepatan serangan dalam sekon
const MAX_TIME = 1
#rasio kecepatan serangan minimum
const MIN_ASPD_RATE = 0.05
#kecepatan peluru
const BULLET_SPD = 1500

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	#set supaya penembak ga ikut muter
	#ambil rotasi penembak
	var rotation_before = rad2deg(get_rot())
	#ambil rotasi player
	var rotation_after = - rad2deg(get_parent().get_parent().get_rot())
	#set rotasi
	set_rot(deg2rad(rotation_after))
	
	#ambil kecepatan rotasi
	var rotation = rotation_after-rotation_before
	#batasi kecepatan rotasi
	rotation = max(rotation, -MAX_ROT)
	#set rasio kecepatan serangan
	var aspd_rate = 1-(rotation/-MAX_ROT)
	var aspd = max(aspd_rate * MAX_TIME, MIN_ASPD_RATE)
	
	#masukkan penambahan waktu dalam variabel
	time += delta
	if(time>=aspd && aspd != 0 && aspd_rate != 1):
		time-=aspd
		var bullet = BULLET.instance()
		bullet.set_pos(get_global_pos())
		var bullet_direction = self.get_global_pos() - get_parent().get_parent().get_global_pos()
		var velocity = bullet_direction.normalized()*BULLET_SPD
		#print(str(velocity))
		bullet.set_linear_velocity(velocity)
		get_tree().get_root().add_child(bullet)
	
	#print(str(time))
	print(str(aspd_rate))