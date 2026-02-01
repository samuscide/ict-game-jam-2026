extends Node
var directions = [0,1,2,3,4,5,6,7,8]
#[Vector2(0.3437246,.848483),Vector2(0,1)]




var dialogueOption = {
	"isHidden" : false,
	"text" : "",
	"requiredEvents" : []
}

var dialgogueTree = {
	"options" : [dialogueOption]
}
#[dialogtree1,dialogtree1,dialogtree1]


var NPCs = []
var NPC = {
	"name" : "Defualt",
	"name_2" : "Defualt",
	"dialoguePreference" : "Confrontational",
	"dispositionRate" : 10,
	"expertise" : "",
	"department" : "patient",
	"mood" : "apathetic" , 
	"dialogueState" : 0 #this is where the player is on this NPCs dialogue tree
}



var Junction = {
	"name" : "reception",
	"directions" : [],
	"adjacentJunctions" : ["cafeteria","hallway","lab","patient1"] ,
	"npcs" : ["robert","janice","jim"] ,	
	"items" : []
}


var activeJunction = Junction.duplicate()


var roomLibrary = {
	"admin": preload("res://Assets/rooms/Admin.png"),
	"cafeteria": preload("res://Assets/rooms/Cafeteria.png"),
	"hallway": preload("res://Assets/rooms/Hallway.png"),
	"lab": preload("res://Assets/rooms/Lab.png"),
	"morgue": preload("res://Assets/rooms/Morgue.png"),
	"patient1": preload("res://Assets/rooms/Patient Room1.png"),
	"patient2": preload("res://Assets/rooms/Patient Room2.png"),
	"reception": preload("res://Assets/rooms/Reception.png"),
	"reception2": preload("res://Assets/rooms/Reception2.png"),
	"surgery": preload("res://Assets/rooms/Surgery.png")
}

var characterLibrary = {
	"robert": preload("res://Assets/characters/ppeperson1.png"),
	"mia": preload("res://Assets/characters/surgeon.png"),
	"janice": preload("res://Assets/characters/pressureSurgeon.png"),
	"jim": preload("res://Assets/characters/security.png"),
	"janitor": preload("res://Assets/characters/janitor.png")
}

func _enter_tree() -> void:
	var admin = Junction.duplicate()
	admin["name"] = "administration"
	admin["directions"] = [1,5,6,7,8]
	
	#initialize NPCS
	
	for i in range(2):
		match i:
			0:
				NPCs.append(NPC.duplicate())
				NPCs[i]["name"] = "robert"
				NPCs[i]["name_2"] = "sanchez"
				NPCs[i]["dialoguePreference"] = "Confrontational"
				NPCs[i]["dispositionRate"] =  40
				NPCs[i]["expertise"] = "Civilian"
				NPCs[i]["department"] = "Civilian"
				NPCs[i]["mood"] = "Angry"
				NPCs[i]["dialogueState"] = 0
			1:
				NPCs.append(NPC.duplicate())
				NPCs[i]["name"] = "robert"
				NPCs[i]["name_2"] = "sanchez"
				NPCs[i]["dialoguePreference"] = "Confrontational"
				NPCs[i]["dispositionRate"] =  40
				NPCs[i]["expertise"] = "Civilian"
				NPCs[i]["department"] = "Civilian"
				NPCs[i]["mood"] = "angry"
				NPCs[i]["dialogueState"] = 0


		
		
		
	
	
func onJunctionLoad(activeJunction):
	#$gameUI.build_junction(Junction.adjacentJunctions[1])
	#save routine 
	
	#load routine
	var JunctionName = activeJunction.Name
	#look through save rewrite Junctions parameters with 
	#populate room scene data with active junction data

func movementButtonEngaged(direction):
	#move scene logic
	activeJunction.Name = activeJunction["adjacentJunctions"][activeJunction["directions"][direction]]
	#activeJunction = adjacentJunction[activeJunction["directions"][direction]]
	pass


#NPCs from benjamin
#[node name="NPC2" parent="." unique_id=1271583253 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Confrontational"
#Disposition = 40
#Name = "robert"
#Name_2 = "sanchezz"
#DispositionRate = 10
#Expertise = "Civilian"
#Department = "Civilian"
#Mood = "Angry"
#
#[node name="NPC3" parent="." unique_id=965265231 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Inquisitive"
#Disposition = 42
#Name = "jim"
#Name_2 = "tim"
#DispositionRate = 2
#Expertise = "Accountant"
#Department = "Managment"
#Mood = "Apathetic"
#
#[node name="NPC4" parent="." unique_id=324083473 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Vague"
#Name = "mia"
#Name_2 = "that depressed  nurse"
#DispositionRate = 15
#Mood = "Sad"
#
#[node name="NPC1" parent="." unique_id=1931630368 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Direct"
#Disposition = 50
#Name = "Janice"
#Name_2 = "Jan"
#DispositionRate = 5
#Expertise = "Nurse"
#Department = "Nurses"
#Mood = "Cheerful"
	

	
