extends Window

var xrand = randi()% 3
var movetimer = randi()% 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
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
	
	position.x = max(position.x, 0)
	position.x = min(position.x, DisplayServer.screen_get_size().x - ralx)
	
	movetimer = movetimer - delta
	if movetimer <= 0:
		movetimer = randi()% 11
		xrand = randi()% 4
	
	match xrand:
		0: position.x += 1 # move right
		1: position.x -= 1 # move left
		2: position.x += 0 # nothing
		
	match xrand:
		0: 
			get_child(0).get_child(0).animation = "walk"  # sprite right
			get_child(0).get_child(0).flip_h = true 
		1: 
			get_child(0).get_child(0).animation = "walk" # sprite left
			get_child(0).get_child(0).flip_h = false
		2: 
			get_child(0).get_child(0).animation = "idle" # stand
			get_child(0).get_child(0).flip_h = false
		3: get_child(0).get_child(0).animation = "emote2"
			
		
	print(xrand," ", movetimer)

	
