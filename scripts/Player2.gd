extends KinematicBody2D

#variabel
#posisi objek player
var player_pos = Vector2(0,0)

#konstanta
#rasio deselerasi objek player
const DECELERATION_RATE = 0.95
#rasio rotasi objek player
const ROTATION_RATE = 2

func _ready():
	set_process(true)
	set_process_input(true)

func _input(event):
	#ambil akselerasi touch drag
	var rel_pos = event.relative_pos
	#set kecepatan
	var speed = Vector2(rel_pos.x,rel_pos.y) * 0.2
	player_pos = speed

func _process(delta):
	#gerak
	#deselerasi
	player_pos *= DECELERATION_RATE
	move(player_pos)
	
	#putar
	#ambil rotasi objek
	var rot = rad2deg(self.get_rot())
	#hitung perubahan gerakan
	var travel_length = self.get_travel().length()
	#print(str(travel_length))
	#apply perubahan rotasi
	rot += travel_length * ROTATION_RATE
	self.set_rotd(rot)
	