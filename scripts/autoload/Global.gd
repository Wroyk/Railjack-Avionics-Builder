extends Node
var integrated_avionics: Array
var tactical_avionics: Array
var battle_avionics: Dictionary


func _init():
	integrated_avionics = _load_integrated_avionics("res://jsons/integrated_avionics.json")
	tactical_avionics = _load_tactical_avionics("res://jsons/tactical_avionics.json")
	battle_avionics =  _load_battle_avionics("res://jsons/battle_avionics.json")
	


func _load_integrated_avionics(var path: String)-> Array:
	var j_res: Array
	var file : File
	
	file = File.new()
	var res = file.open(path,File.READ)
	if res == OK:
		var json = file.get_as_text()
		
		file.close()
		
		res = JSON.parse(json)
		if res.error == OK:
			j_res = res.result
	
	return j_res

func _load_tactical_avionics(var path: String)-> Array:
	var j_res: Array
	var file : File
	
	file = File.new()
	var res = file.open(path,File.READ)
	if res == OK:
		var json = file.get_as_text()
		file.close()
		
		res = JSON.parse(json)
		if res.error == OK:
			j_res = res.result
	
	return j_res

func _load_battle_avionics(var path: String)-> Dictionary:
	var j_res: Dictionary
	var file : File
	
	file = File.new()
	var res = file.open(path,File.READ)
	if res == OK:
		var json = file.get_as_text()
		file.close()
		
		res = JSON.parse(json)
		if res.error == OK:
			j_res = res.result
	
	return j_res