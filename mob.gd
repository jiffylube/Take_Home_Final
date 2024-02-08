extends CharacterBody2D

const max_health = 10
@export var health = max_health

func _ready():
	set_health()

func set_health():
	$HealthBar.max_value = max_health
	$HealthBar.value = health

func _physics_process(delta):
	pass

func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		health -= 5
		$HealthBar.value = health
		print("Hit! Enemy Health " , health)
		if health <= 0:
			queue_free()
			get_parent().add_killed()
