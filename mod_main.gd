extends Node

const DIR := "RougeShadow-DebugUnlocker"
const LOG_NAME := "RougeShadow-DebugUnlocker:Main"

var mod_dir_path := ""
var extensions_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(DIR)
	install_script_extensions()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("autoloads/pausemenu/pause_menu_code.gd"))


func _ready() -> void:
	ModLoaderLog.info("Ready!", LOG_NAME)
