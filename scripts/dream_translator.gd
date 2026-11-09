extends Node

var translation_count : int = 0
var locales : Array[String]
var flags : Array[AtlasTexture]

var pause_menu : Node
var option_language : Node

func _ready() -> void:	
	get_tree().node_added.connect(on_node_added)
	game.config_updated.connect(_on_apply_config)

func on_node_added(node: Node):
	match node.name:
		"pause_menu":
			pause_menu = node
		"option_language":
			option_language = node
			
			for flag in flags:
				option_language.get("variant").push_back(flag)
			
			for signal_connection in option_language.get_signal_connection_list("pressed"):
				if signal_connection.callable.get_method() == "_on_option_language_pressed":
					option_language.disconnect(signal_connection.signal.get_name(), signal_connection.callable)
			option_language.connect("pressed", _on_option_language_pressed)

func _on_apply_config() -> void:
	match config.language:
		0, 1, 2, 3: return
		_: TranslationServer.set_locale(locales[config.language - 4])

func _on_option_language_pressed() -> void :
	config.language = (config.language + 1) % (4 + translation_count)
	pause_menu.call("_upd_option_language")
	game.apply_config()
