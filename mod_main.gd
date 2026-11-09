extends Node

const MOD_DIR := "totobono4-dream_translator_api"
const LOG_NAME := "totobono4-dream_translator_api:Log "

var mod_dir_path := "res://mods-unpacked/totobono4-dream_translator_api"
var scripts_dir_path := mod_dir_path.path_join("scripts")

var dream_translator_script : Script = load(scripts_dir_path.path_join("dream_translator.gd"))
var dream_translator_name := "dream_translator"
var dream_translator: Node

func _init() -> void:
	print(LOG_NAME, "Initialization..")
	
	dream_translator = Node.new()
	dream_translator.set_name(dream_translator_name)
	dream_translator.set_script(dream_translator_script)
	add_child(dream_translator)
	
	print(LOG_NAME, "Initialized.")

func add_dream_translation(flag: AtlasTexture, translation: OptimizedTranslation):
	TranslationServer.add_translation(translation)
	dream_translator.translation_count += 1
	dream_translator.locales.push_back(translation.locale)
	dream_translator.flags.push_back(flag)
	
	print(LOG_NAME, "translation ", translation.locale, " loaded successfully.")
