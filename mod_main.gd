extends Node

const MOD_DIR := "totobono4-dream_translator_api"
const LOG_NAME := "totobono4-dream_translator_api:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
var scenes_dir_path := mod_dir_path.path_join("scenes")

var packed_dream_translator : PackedScene = load(scenes_dir_path.path_join("dream_translator.tscn"))
var dream_translator

func _init() -> void:
	dream_translator = packed_dream_translator.instantiate()
	add_child(dream_translator)

func add_dream_translation(flag: AtlasTexture, translation: OptimizedTranslation):
	ModLoaderMod.add_translation(translation.resource_path)
	dream_translator.translation_count += 1
	dream_translator.locales.push_back(translation.locale)
	dream_translator.flags.push_back(flag)
	dream_translator.apply_config()
	
	ModLoaderLog.info("translation " + translation.locale + " loaded successfully", LOG_NAME)
