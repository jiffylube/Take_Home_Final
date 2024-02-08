extends Node

const SAVEFILE:String = "user://savefile.save"

var total_killed: int = 0

func _ready():
	load_score()

func save_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(total_killed)
	file = null
	
func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		total_killed = file.get_32()
	print("Total Killed loaded  >>> " , total_killed)
	file = null
