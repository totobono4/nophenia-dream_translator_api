extends Node

const MOD_DIR := "totobono4-translate_dream_api"
const LOG_NAME := "totobono4-translate_dream_api:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)

func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)

func _ready() -> void:
	ModLoaderLog.info("Ready", LOG_NAME)
