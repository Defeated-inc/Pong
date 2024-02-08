class_name SaverLoader
extends Node

@onready var player_1 = %Player1
@onready var player_2 = %Player2

@onready var inv_p_1 = %InvP1
@onready var inv_p_2 = %InvP2

@onready var save_load_message = %save_load_message

func save_game():
	var saved_game:SavedGame = SavedGame.new()
	
	saved_game.p1_score = Main.p1_score
	saved_game.p2_score = Main.p2_score
	
	
	saved_game.p1_inventory = player_1.inventory.get_items()
	saved_game.p2_inventory = player_2.inventory.get_items()
	
	ResourceSaver.save(saved_game, "user://savegame.tres")
	
	save_load_message.text = "Jogo Salvo :)"
	save_load_message.visible = true
	await get_tree().create_timer(2.0).timeout
	save_load_message.visible = false
	
func load_game():
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	Main.p1_score = saved_game.p1_score
	Main.p2_score = saved_game.p2_score
	
	player_1.inventory.set_items(saved_game.p1_inventory)
	player_2.inventory.set_items(saved_game.p2_inventory)
	
	inv_p_1.show_items(player_1.inventory)
	inv_p_2.show_items(player_2.inventory)
	
	save_load_message.text = "Jogo Carregado :)"
	save_load_message.visible = true
	await get_tree().create_timer(2.0).timeout
	save_load_message.visible = false
