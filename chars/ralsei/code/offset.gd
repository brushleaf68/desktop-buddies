extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_flag(
		DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH,
		true
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#offset.y = 0 - sprite_frames.get_frame_texture(animation,frame).get_height()
	pass
