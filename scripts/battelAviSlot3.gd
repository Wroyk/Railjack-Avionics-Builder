extends HBoxContainer

var total_drain : int
var bace_drain : int
var rank:int

var avionic : OptionButton
var avi_rank : OptionButton
var grid_rank : OptionButton

var text_Drain: RichTextLabel

func _ready():
	avionic = get_child(0)
	avi_rank = get_child(1)
	grid_rank = get_child(2)
	
	text_Drain = get_child(4)
	
	avionic.add_item("None")
	avionic.set_item_metadata(0, {"name":null, "dec":"", "drain":null, "ranks":null})
	
	grid_rank.add_item("0")
	grid_rank.add_item("1")
	grid_rank.add_item("2")
	grid_rank.add_item("3")
	
	
	_add_avionics_to_select()
	
	_on_Avionic_item_selected(0)
	

func _add_avionics_to_select()->void:
	var i: int = 1
	for intavi in Global.battle_avionics.third:
		avionic.add_item(intavi.name)
		avionic.set_item_metadata(i,intavi)
		i+=1


func _on_Avionic_item_selected(ID):
	var meta : Dictionary = avionic.get_item_metadata(ID)
	var ranks : int
	
	if meta.drain != null:
		bace_drain = meta.drain
	else:
		bace_drain = 0
		
	if meta.ranks != null:
		ranks = meta.ranks
	else:
		ranks = 0
	
	avi_rank.clear()
	var i:int = 0
	while i<=ranks:
		avi_rank.add_item(String(i))
		i+=1
	
	_on_Rank_item_selected(0)


func _on_Rank_item_selected(ID):
	rank = avi_rank.get_item_text(ID).to_int()
	update_total_drain()

func _on_Grid_item_selected(ID):
	pass 

func update_total_drain()->void:
	total_drain = bace_drain + rank
	text_Drain.clear()
	text_Drain.add_text(String(total_drain))