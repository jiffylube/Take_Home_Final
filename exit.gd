extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player exiting")
		get_parent().game_start()
