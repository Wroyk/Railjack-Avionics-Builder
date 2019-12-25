extends HBoxContainer

var total_drain : int
var bace_drain : int
var rank : int
var grid : int
var total_value : float
var bace_value : float

var avionic : OptionButton
var house : OptionButton
var avi_rank : OptionButton
var grid_rank : OptionButton

var text_Drain: RichTextLabel
var text_Value: RichTextLabel

func _ready():
	avionic = get_child(0)
	house = get_child(1)
	avi_rank = get_child(2)
	grid_rank = get_child(3)
	
	text_Drain = get_child(5)
	text_Value = get_child(7)
	
	avionic.add_item("None")
	avionic.set_item_metadata(0, {"name":null, "descriptione":"", "houses":null})
	
	grid_rank.add_item("0")
	grid_rank.add_item("1")
	grid_rank.add_item("2")
	grid_rank.add_item("3")
	
	
	_add_avionics_to_select()
	
	_on_Avionic_item_selected(0)


func _add_avionics_to_select()->void:
	
	var i: int = 1
	for intavi in Global.integrated_avionics:
		avionic.add_item(intavi.name)
		avionic.set_item_metadata(i,intavi)
		i+=1

func _on_Avionic_item_selected(ID)->void:
	var meta: Dictionary = avionic.get_item_metadata(ID)
	house.clear()
	if meta.houses == null:
		house.add_item("None")
		house.set_item_metadata(0,0)
	else:
		var i : int = 0
		for key in meta.houses.keys():
			if meta.houses[key] != null:
				house.add_item(key)
				house.set_item_metadata(i,ID)
				i+=1
	
	_on_House_item_selected(0)

func _on_House_item_selected(ID)->void:
	var meta : int = house.get_item_metadata(ID)
	var key : String = house.get_item_text(ID)
	var avimeta : Dictionary = avionic.get_item_metadata(meta)
	var ranks : int
	
	avi_rank.clear()
	
	if avimeta.houses == null:
		ranks = 0;
		bace_drain = 0
		bace_value = 0
	else:
		ranks = avimeta.houses[key].ranks
		bace_drain = avimeta.houses[key].drain
		bace_value = avimeta.houses[key].valiu
	
	var i : int = 0
	while i<=ranks :
		avi_rank.add_item(String(i))
		i+=1
		
	_on_AviRank_item_selected(0)

func _on_AviRank_item_selected(ID)->void:
	rank = avi_rank.get_item_text(ID).to_int()
	update_total_drain()
	update_total_value()

func _on_GridRank_item_selected(ID):
	grid = grid_rank.get_item_text(ID).to_int()
	update_total_value()
	
func update_total_drain()->void:
	total_drain = bace_drain + rank
	text_Drain.clear()
	text_Drain.add_text(String(total_drain))

func update_total_value()->void:
	total_value = bace_value * (float(rank) + 1.0 + float(grid))
	text_Value.clear()
	text_Value.add_text(String(total_value))

