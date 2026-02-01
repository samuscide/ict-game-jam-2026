extends Control

@onready var pause = $pause
@onready var dialog = $dialog
@onready var CharacterName = $dialog/Label
@onready var firstText = $dialog/RichTextLabel
@onready var secondText = $dialog/RichTextLabel2
@onready var options = $options
@onready var dialogOptions = $avialableCharacters
@onready var junctions = $junctions

@onready var dialog1 = $avialableCharacters/Button
@onready var dialog2 = $avialableCharacters/Button2
@onready var dialog3 = $avialableCharacters/Button3
@onready var dialog4 = $avialableCharacters/Button4

@onready var charDialogeFirst = $dialog/dialogOptions/Button
@onready var charDialogeSecond = $dialog/dialogOptions/Button2
@onready var charDialogeThird = $dialog/dialogOptions/Button3
@onready var charDialogeSecret = $dialog/dialogOptions/Button4


var avialableCharactersButtons = [dialog1,dialog2,dialog3,dialog4]
var npcs = RoomManager.activeJunction["npcs"]
var playerState = gameState.playerEncounters


var janice = Reception.get_node("NPC1")
var robert = Reception.get_node("NPC2")
var jim = Reception.get_node("NPC3")
var mia = Reception.get_node("NPC4")

var npcProfiles = [ janice, jim ]
var activeNPC = ""
var activeNPCIdx = 0
var npcOutcomes = [0,0,0,0]
var outComeTypes = ""
var pathID = 0
var dispRate = 0

# Hides the buttons we don't need in dialogOptions
func hideCommunicate(node: Button) -> void:
	node.visible = false

func hideControl() -> void:
	pause.visible = false
	dialog.visible = false
	options.visible = false
	dialogOptions.visible = false



func disableNode(node: Button):
	node.disabled = true

func revealNode(node: Control) -> void:
	node.visible = true

func _ready() -> void:
	charDialogeFirst.pressed.connect(_on_D_Option1_Pressed)
	charDialogeSecond.pressed.connect(_on_D_Option2_Pressed)
	charDialogeThird.pressed.connect(_on_D_Option3_Pressed)
	charDialogeSecret.pressed.connect(_on_D_OptionSecret_Pressed)
	
	# Start with all UI not visible
	hideControl()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") and !pause.visible == true:
		hideControl()
		pause.visible = true

# Pause functionality
func _on_return_pressed() -> void:
	hideControl()
	options.visible = true
	pass # Replace with function body.

func _on_save_pressed() -> void:
	# TODO: give visual feedback that the game was saved
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu/Menu.tscn")

# Options functionality
func _on_communicate_pressed() -> void:
	hideControl()
	
	dialogOptions.visible = true
	avialableCharactersinRoom()
	pass # Replace with function body.

func updateJunctions() -> void:
	var activeJunction = RoomManager.activeJunction
	var visibleDirections = [false,false,false,false,false,false,false,false]
	var directionCount = junctions.get_child_count()
	var activeDirectionCount = activeJunction["directions"].size()
	for i in range(activeDirectionCount):
		for j in range(directionCount):
			if(activeJunction["directions"][i] == j): # for every active direction is it the same as our buttons direction? if yes then:
				visibleDirections[j] = visibleDirections[j] || true # we are at an active direction, lets keep it to render later
				junctions.get_child(j).get_node("Label").text = activeJunction["adjacentJunctions"][i] # lets set the direction with the coresponding location
	#im doing a seperate for loop to disable/enable the innactive/active direction buttons
	for k in range(directionCount):
		if(visibleDirections[k]):
			junctions.get_child(k).visible = true
		else:
			junctions.get_child(k).visible = false
	pass

func _on_movement_pressed() -> void:
	hideControl()
	junctions.visible = true
	updateJunctions()
	pass # Replace with function body.


	# TODO: reveal junctions via roomManager


func _on_observe_pressed() -> void:
	hideControl()
	dialog.visible = true
	pass # Replace with function body.

# dialog options functionality
func _on_button_pressed() -> void: #go to npc 1
	hideControl()
	enterDialogueWith(npcs[0])
	dialog.visible = true


func _on_button_2_pressed() -> void: #go to npc 2
	hideControl()
	enterDialogueWith(npcs[1])
	dialog.visible = true


func _on_button_3_pressed() -> void: #go to npc 3
	hideControl()
	enterDialogueWith(npcs[2])
	dialog.visible = true


func _on_button_4_pressed() -> void: #go to npc 4
	hideControl()
	enterDialogueWith(npcs[3])
	dialog.visible = true
	
	
func continueDialogue(out):
	playerState["npcs"][activeNPC]["dialoguePathIDs"].append(pathID)
	
	playerState["npcs"][activeNPC]["dialoguePosition"] = out
	
	enterDialogueWith(activeNPC)
	pass
	
func _on_D_Option1_Pressed():
	var out = npcOutcomes[0]
	#if(outComeTypes[0] == npcProfiles[activeNPCIdx].Prefered_diologe_type):
		#playerState["npcs"][activeNPC]["disposition"] = playerState["npcs"][activeNPC]["disposition"] + dispRate
		#print(playerState["npcs"][activeNPC]["disposition"])
		#print(dispRate)
	if(out == 100):
		playerState["npcs"][activeNPC]["dialoguePathIDs"].append(pathID)
		hideControl()
		options.visible = true
	else:
		continueDialogue(out)
		pass

func _on_D_Option2_Pressed():
	var out = npcOutcomes[1]
	if(out == 100):
		playerState["npcs"][activeNPC]["dialoguePathIDs"].append(pathID)
		hideControl()
		options.visible = true
	else:
		continueDialogue(out)
		pass
	
func _on_D_Option3_Pressed():
	var out = npcOutcomes[2]
	if(out == 100):
		playerState["npcs"][activeNPC]["dialoguePathIDs"].append(pathID)
		hideControl()
		options.visible = true
	else:
		continueDialogue(out)
		pass
	
func _on_D_OptionSecret_Pressed():
	var out = npcOutcomes[3]
	if(out == 100):
		playerState["npcs"][activeNPC]["dialoguePathIDs"].append(pathID)
		hideControl()
		options.visible = true
	else:
		continueDialogue(out)
		pass
	
func avialableCharactersinRoom():
	var room = RoomManager.activeJunction 
	if(room):
		#var npcs = room["npcs"]
		for i in range(4):
			if(i < npcs.size()):
				match i:
					0:
						dialog1.text = npcs[i]
					1: 
						dialog2.text = npcs[i]
					2: 
						dialog3.text = npcs[i]
					3:
						dialog4.text = npcs[i]
			else :
				match i:
					0:
						hideCommunicate(dialog1)
					1: 
						hideCommunicate(dialog2)
					2: 
						hideCommunicate(dialog3)
					3:
						hideCommunicate(dialog4)
						
				
				
				
				
func enterDialogueWith(npc):
	activeNPC = npc
	for i in range(npcs.size()):
		if(npc == npcProfiles[i].Name):
			activeNPCIdx = i	
			CharacterName.text = npc
			if(!playerState["npcs"][npc]["hasEncountered"]):
				var D1 = npcProfiles[i].get_child(0)
				firstText.text = D1.Diologue_text_initial
				secondText.text = D1.Diologue_text_leading
				charDialogeFirst.text = D1.Char_Diologue_first_option
				charDialogeSecond.text = D1.Char_Diologue_second_option
				charDialogeThird.text = D1.Char_Diologue_third_option
				charDialogeSecret.text = D1.Char_Diologue_secret_option
				npcOutcomes = [D1.Char_Diologue_first_option_outcome, D1.Char_Diologue_second_option_outcome, D1.Char_Diologue_third_option_outcome, D1.Char_Diologue_secret_option_outcome]
				#outComeTypes = [D1.Char_Diologue_first_option_type,D1.Char_Diologue_second_option_type,D1.Char_Diologue_third_option_type,D1.Char_Diologue_secret_option_type]
				pathID = D1.Diologue_path_id

				#print(npcOutcomes)
				playerState["npcs"][npc]["hasEncountered"] = true
			elif(playerState["npcs"][npc]["hasEncountered"]):
				var D = npcProfiles[i].get_child(playerState["npcs"][activeNPC]["dialoguePosition"])
				firstText.text = D.Diologue_text_initial
				secondText.text = D.Diologue_text_leading
				charDialogeFirst.text = D.Char_Diologue_first_option
				charDialogeSecond.text = D.Char_Diologue_second_option
				charDialogeThird.text = D.Char_Diologue_third_option
				var pIDs = playerState["npcs"][activeNPC]["dialoguePathIDs"]
				var isSecretVisable = false
				#print(pIDs , "requisite:" , D.Char_Diologue_secret_option_requisite)
				for ID in pIDs:
					var ID_Match = D.Char_Diologue_secret_option_requisite == ID
					if(ID_Match):
						#print("match")
						isSecretVisable = isSecretVisable || ID_Match
						
				dispRate = npcProfiles[i].DispositionRate
				var disp = playerState["npcs"][activeNPC]["disposition"]
				var dispThresh = D.Char_Diologue_secret_option_dispositon
				if(disp >= dispThresh and dispThresh != 0):
					isSecretVisable = true
				if(isSecretVisable):
					charDialogeSecret.visible = true
					charDialogeSecret.text = D.Char_Diologue_secret_option
				else:
					charDialogeSecret.visible = false
				
						

				
				npcOutcomes = [D.Char_Diologue_first_option_outcome, D.Char_Diologue_second_option_outcome, D.Char_Diologue_third_option_outcome, D.Char_Diologue_secret_option_outcome]
				#outComeTypes = [D.Char_Diologue_first_option_type,D.Char_Diologue_second_option_type,D.Char_Diologue_third_option_type,D.Char_Diologue_secret_option_type]
				pathID = D.Diologue_path_id

				pass
			else:
				pass
	
	pass
				
