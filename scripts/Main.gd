extends Control

var text_total:RichTextLabel

var islot1:OptionButton
var islot2:OptionButton
var islot3:OptionButton
var islot4:OptionButton
var islot5:OptionButton
var islot6:OptionButton
var islot7:OptionButton
var islot8:OptionButton
var islot9:OptionButton

var tslot1:OptionButton
var tslot2:OptionButton
var tslot3:OptionButton

var bslot1:OptionButton
var bslot2:OptionButton
var bslot3:OptionButton

var absolut_drain:int = 0

func _ready():
	text_total = get_node("Select/VBoxContainer/HBoxContainer/TotalDrain")
	
	islot1 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot1")
	islot2 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot2")
	islot3 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot3")
	islot4 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot4")
	islot5 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot5")
	islot6 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot6")
	islot7 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot7")
	islot8 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot8")
	islot9 = get_node("Select/VBoxContainer/IntegratetAvionics/Slot9")
	
	bslot1 = get_node("Select/VBoxContainer/BattelAvionics/Slot1")
	bslot2 = get_node("Select/VBoxContainer/BattelAvionics/Slot2")
	bslot3 = get_node("Select/VBoxContainer/BattelAvionics/Slot3")
	
	tslot1 = get_node("Select/VBoxContainer/TacticalAvionics/Slot1")
	tslot2 = get_node("Select/VBoxContainer/TacticalAvionics/Slot2")
	tslot3 = get_node("Select/VBoxContainer/TacticalAvionics/Slot3")
	
func _process(delta):
	absolut_drain = islot1.get("total_drain") + islot2.get("total_drain") + islot3.get("total_drain") + islot4.get("total_drain") + islot5.get("total_drain") + islot6.get("total_drain") + islot7.get("total_drain") + islot8.get("total_drain") + islot9.get("total_drain") + bslot1.get("total_drain") + bslot2.get("total_drain")+ bslot3.get("total_drain") + tslot1.get("total_drain") + tslot2.get("total_drain") + tslot3.get("total_drain")
	text_total.clear()
	text_total.add_text(String(absolut_drain))
