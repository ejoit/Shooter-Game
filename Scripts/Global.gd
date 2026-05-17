extends Node

func death(body: Node, coords: Vector2):
	if body.is_in_group("player"):
		body.get_node("Sprite2D").hide()
		body.get_node("Gun-1").hide()
		#deathpar.global_position = coords
		#$Deathpar.restart()
		body.get_node("CollisionShape2D").disabled = true
		#get_node("Deathpar").emitting = true
		body.process_mode = body.PROCESS_MODE_DISABLED
		#$SpikeDeath.play()
		await get_tree().create_timer(0.2).timeout
		get_tree().reload_current_scene()
		return


func hit_stop_short():
	Engine.time_scale = 0
	await get_tree().create_timer(0.1, true , false, true).timeout
	Engine.time_scale =1
