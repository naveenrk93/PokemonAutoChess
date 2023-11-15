extends Node2D

var sprites_array = []
var sprite_count = 0;



func loadSprites():
	var dir = DirAccess.open("res://sprites/pokemon_sprites")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			if ".import" in file_name:
				file_name=dir.get_next()
				continue
			var file_string = "res://sprites/pokemon_sprites/"+file_name
			var image = Image.load_from_file(file_string)
			var temp_texture = ImageTexture.create_from_image(image)
			sprites_array.append(temp_texture) 
			sprite_count = sprite_count + 1
			file_name = dir.get_next()
		print(sprite_count)
		
	
	
	

func loadRandomNumberGenerator():
	var rng1 = RandomNumberGenerator.new()
	var rng2 = RandomNumberGenerator.new()
	var rng3 = RandomNumberGenerator.new()
	var rng4 = RandomNumberGenerator.new()
	var rng5 = RandomNumberGenerator.new()
	var rand1 = rng1.randf_range(0, sprite_count-1)
	var rand2 = rng2.randf_range(0, sprite_count-1)
	var rand3 = rng3.randf_range(0, sprite_count-1)
	var rand4 = rng4.randf_range(0, sprite_count-1)
	var rand5 = rng5.randf_range(0, sprite_count-1)
	$pokemon_1.set_texture(sprites_array[rand1])
	$pokemon_2.set_texture(sprites_array[rand2])
	$pokemon_3.set_texture(sprites_array[rand3])
	$pokemon_4.set_texture(sprites_array[rand4])
	$pokemon_5.set_texture(sprites_array[rand5])
# Called when the node enters the scene tree for the first time.
func _ready():
	loadSprites()
	loadRandomNumberGenerator()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
