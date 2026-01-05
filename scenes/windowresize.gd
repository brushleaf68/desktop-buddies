extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#THIS get the animated sprite 2d inside of ralsei scene
	var ralsprite2d = $ralsei.get_child(0)
	var ralcurfra: int = ralsprite2d.get_frame()
	var ralanim: String = ralsprite2d.animation
	var spriteFrames: SpriteFrames = ralsprite2d.get_sprite_frames()
	var currentTexture: Texture2D = spriteFrames.get_frame_texture(ralanim, ralcurfra)
	
	var ralx = currentTexture.get_width() * 4
	var raly = currentTexture.get_height() * 4
	
	$ralsei.position.x = ralx / 2
	$ralsei.position.y = raly / 2
	
	var new_size = Vector2i(ralx, raly)
	get_window().size = new_size
	
	position.y = 1080 - raly
