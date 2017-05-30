extends Label

func _ready():
	set_process_input(true)
	set_process(true)

func _input(event):
	#self.set_text(str(event.relative_pos))