extends Sprite2D

func _process(delta: float) -> void:
	while (position.y <= 600):
		position.y += 45 * delta
		
		if get_tree():
			await get_tree().create_timer(1).timeout
