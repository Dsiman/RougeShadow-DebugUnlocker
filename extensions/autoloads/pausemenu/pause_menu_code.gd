extends "res://autoloads/pausemenu/pause_menu_code.gd"

func _input(_event):
	if quitting:
		return

	if Input.is_action_just_pressed("caps_lock"):
		get_tree().paused = !get_tree().paused

	if Input.is_action_just_pressed("f1") and debug_build_for_testing:
		debug.visible = !debug.visible
		main.visible = !debug.visible
	if Input.is_action_just_pressed("pause_menu") and player.current_state == player.STATES.WALKING and !player.taken_over:
		if active and settings.modulate.a == 1:
			toggle_settings(false)
			return

		if get_tree().get_first_node_in_group("player").process_mode != Node.PROCESS_MODE_INHERIT:
			get_tree().get_first_node_in_group("player").process_mode = Node.PROCESS_MODE_INHERIT
			get_tree().paused = true
		get_tree().paused = !get_tree().paused

		activate_menu(get_tree().paused)
