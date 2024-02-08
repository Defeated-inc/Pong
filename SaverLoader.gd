class_name SaverLoader
extends Node

func save_game():
	var saved_game:SavedGame = SavedGame.new()
	saved_game.p1_score = Main.p1_score
	saved_game.p2_score = Main.p2_score
	
	ResourceSaver.save(saved_game, "user://savegame.tres")
	
func load_game():
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	Main.p1_score = saved_game.p1_score
	Main.p2_score = saved_game.p2_score
