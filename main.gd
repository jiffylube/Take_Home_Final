extends Node2D

var mob_scene = load("res://mob.tscn")

@onready var total_label = $ColorRect2/VBoxContainer/total_label
@onready var current_label = $ColorRect2/VBoxContainer/current_label

# session score is 0 if save file loads in any way
var current_score = 0 :
	set (x) : current_score = x; current_label.text = str(x)

func _ready():
	game_start()
	update_score_card()

func game_start():
	reset_player_pos()
	add_mob()

func reset_player_pos():
	$Player.position.x = -200
	$Player.position.y = 400

func add_mob():
	var mob = mob_scene.instantiate()
	add_child(mob)
	$Mob.position.x = 700
	$Mob.position.y = 400

func update_score_card():
	total_label.text = str(SaveLoad.total_killed)
	current_label.text = str(current_score)

func add_killed():
	current_score += 1

	if current_score > SaveLoad.total_killed:
		SaveLoad.total_killed = current_score
		total_label.text = str( current_score )
	SaveLoad.save_score()
	
