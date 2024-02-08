extends CharacterBody2D

@export var bullet_scene = load("res://bullet.tscn")
@onready var ray_cast = $RayCast2D
@onready var timer = $Timer

var speed = 200
var health = 100

var mob

func _ready():
	set_health()
	mob = get_parent().find_child("Mob")

func _physics_process(delta):
	velocity.x = speed
	move_and_slide()
	check_mob_collision()
	

func set_health():
	$health_bar.value = health

#func get_input():
	#if Input.is_action_just_pressed("Shoot"):
		#shoot()
	
func check_mob_collision():
# if collision is a mob start the timer
	if ray_cast.get_collider() == mob :
		timer.start()

func _on_timer_timeout():
	shoot()
	
func shoot():
	print("pew!")
	var b = bullet_scene.instantiate()
	get_tree().current_scene.add_child(b)
	#owner.add_child(b)
	b.transform = $Muzzle.global_transform
