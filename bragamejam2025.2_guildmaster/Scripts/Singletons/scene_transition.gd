extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
#@onready var timer: Timer = $Timer

func _ready() -> void:
	color_rect.visible = false

func reload_currentscene():
	get_tree().reload_current_scene()

func change_scene(scene: String):
	color_rect.visible = true
	var timer = get_tree().create_timer(randf_range(0.9, 1.5))
	print(timer.time_left)
	await timer.timeout
	
	get_tree().change_scene_to_file(scene)
	
	color_rect.visible = false
