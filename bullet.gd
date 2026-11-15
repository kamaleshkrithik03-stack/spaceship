extends Area2D

@export var bullet_speed: float = 600.0

func _process(delta: float) -> void:
	position.x += bullet_speed * delta
	if position.x > 2000:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bomb"):
		area.queue_free() 
		get_tree().call_group("game_manager", "add_diamonds", 2) 
		queue_free() 
