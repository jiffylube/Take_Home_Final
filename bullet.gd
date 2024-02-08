extends Area2D

@export var speed = 750

# bullet controller
var tim : float = 0.0 # constant start
var lifetime : float = 0.5 # projectile lifetime

func _physics_process(delta):
	
	if tim < lifetime:
		tim += delta
	else:
		queue_free()
	
	position += transform.x * speed * delta

func _on_body_entered(body):
	queue_free()
	
