extends Node

const MOD_DIR = "mods"
var mod_order: Array[String] = []

func _init() -> void:
	if not OS.has_feature("editor"):
		initialize_mod_system()
	else:
		print("Startup Initialized, skipping mod load while in editor, try testing your mods individually and then test them all together by exporting and building them")

func initialize_mod_system() -> void:
	var yaml_path = OS.get_executable_path().get_base_dir().path_join(MOD_DIR).path_join("mod_order.yaml")
	var parsed = YamlParser.parse_file(yaml_path)
	if parsed and parsed.has("mods"):
		mod_order = parsed.mods.map(func(mod): return str(mod))
	else:
		push_warning("No mod_order.yaml found at " + yaml_path + " - mods will be loaded in alphabetical order")
		mod_order = []
	
	load_mods()

func load_mods() -> void:
	var scan_path = OS.get_executable_path().get_base_dir().path_join(MOD_DIR)
	var all_files: Array[String] = []
	FileManager.get_all_files(all_files, scan_path)
	var mod_files = all_files.filter(func(path): return path.get_extension() == "zip")
	
	if mod_files.is_empty():
		push_error("No mod zip files found in " + scan_path)
		return
		
	# Sort mods according to order
	if not mod_order.is_empty():
		var unordered = mod_files.filter(func(path): return not mod_order.has(path.get_file().split(".")[0]))
		mod_files = mod_order.map(func(name): return mod_files.filter(func(path): return path.get_file().split(".")[0] == name)[0])
		mod_files.append_array(unordered)
	
	# Load mods
	for path in mod_files:
		if ProjectSettings.load_resource_pack(path, true):
			var mod_name = path.get_file().split(".")[0]
			add_child(load("res://" + mod_name + "/init_scene.tscn").instantiate())

func _ready() -> void:
	call_deferred("load_main_menu")

func load_main_menu() -> void:
	get_tree().change_scene_to_file(ConfigManager.config.main_menu_scene)
