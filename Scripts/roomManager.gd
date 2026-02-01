extends Node



#NPC Dialogue System 
#var janice = Reception.get_node("NPC1")
#var robert = Reception.get_node("NPC2")
#var jim = Reception.get_node("NPC3")
#var mia = Reception.get_node("NPC4")
#var jani = Reception.get_node("NPC5")
#var sandi = Reception.get_node("NPC6")
#var cheg = Reception.get_node("NPC7")
#var johan = Reception.get_node("NPC8")
#var angelo = Reception.get_node("NPC9")
#var kyle = Reception.get_node("NPC10")
#var phelicia = Reception.get_node("NPC11")
#var criag = Reception.get_node("NPC12")
#var hilda = Reception.get_node("NPC13")
#var skye = Reception.get_node("NPC14")
#
#var NPC_PROFILES = [janice,robert,jim,mia,jani,sandi,cheg,johan,angelo,kyle,phelicia,criag,hilda,skye]
var NPC_NAMES = ["janice","robert","jim","mia", "jani", "sandi","cheg", "johan", "angelo", "kyle", "phelicia", "craig", "hilda", "skye"] 

#template for junction/room
var Junction = {
	"name" : "reception",
	"directions" : [1,3,4,6], #eight directions [0,1,2,3,4,5,6,7] can be [n,s,e,w,ne,nw,se,sw] or [sw,w,nw,n,ne,e,se,s] starting from direction [-1,-1](sw) going clockwise in a circle
	"adjacentJunctions" : ["cafeteria","hallway","lab","patient1"] ,
	"npcs" : ["robert","janice"] 
}

#junction initializer
func defineJunction(jname, directions, adjacentJunctions, npcs):
	var junct = Junction.duplicate(false)
	junct["name"] = jname
	junct["directions"] = directions
	junct["adjacentJunctions"] = adjacentJunctions
	junct["npcs"] = npcs
	return junct

#which junction we are curently in
#var activeJunction = Junction.duplicate()


var roomLibrary = {
	"admin": preload("res://Assets/finishedRooms/administration.png"),
	"cafeteria": preload("res://Assets/finishedRooms/cafeteria.png"),
	"hallway": preload("res://Assets/finishedRooms/hallway.png"),
	"lab": preload("res://Assets/rooms/Lab.png"), #
	"morgue": preload("res://Assets/finishedRooms/morgue1.png"),
	"patient1": preload("res://Assets/finishedRooms/patient1.png"),
	"patient2": preload("res://Assets/finishedRooms/patient2.png"),
	"reception": preload("res://Assets/finishedRooms/reception.png"),
	"reception2": preload("res://Assets/finishedRooms/receptionBehind.png"),
	"surgery": preload("res://Assets/finishedRooms/surgery.png"),
	"breakroom": preload("res://Assets/rooms/Hallway.png") #
}

var characterLibrary = {
	"robert": preload("res://Assets/characters/robert4.png"),
	"mia": preload("res://Assets/characters/mia.png"),
	"janice": preload("res://Assets/characters/Janice.png"),
	"jim": preload("res://Assets/characters/jim2.png"),
	"jani": preload("res://Assets/characters/janitor.png"),
	"sandi": preload("res://Assets/characters/ppeperson1.png"), #
	"cheg": preload("res://Assets/characters/security.png"),
	"johan": preload("res://Assets/characters/Janice.png"), #
	"angelo": preload("res://Assets/characters/angelo.png"),
	"kyle": preload("res://Assets/characters/pressureSurgeon.png"), 
	"phelicia": preload("res://Assets/characters/mia.png"),
	"craig": preload("res://Assets/characters/surgeon.png"),
	"hilda": preload("res://Assets/characters/jim1.png"), #
	"skye": preload("res://Assets/characters/skye.png")
}

#collection of all junctions



var reception = defineJunction("reception",[0,1,3],["patient1","hallway","receptionDesk"],["janice","jim"])
var receptionDesk = defineJunction("receptionDesk",[1,3,4],["reception","patient1","hallway"],["skye"])
var patient1 = defineJunction("patient1",[3,4],["receptionDesk","patient2"],["mia","robert"])
var patient2 = defineJunction("patient2",[6],["patient1"],["kyle"])
var hallway = defineJunction("hallway",[0,2,3,4,6,7],["surgery","admin","cafeteria","breakroom","reception","bathroom"],["cheg"])
var bathroom = defineJunction("bathroom",[1],["hallway"],["jim"])
var surgery = defineJunction("surgery",[7],["hallway"],["johan","criag"])
var breakroom = defineJunction("breakroom",[5],["hallway"],["jani"])
var cafeteria = defineJunction("cafeteria",[3],["hallway"],["jani"])
var admin = defineJunction("admin",[3,7],["morgue","hallway"],["hilda","sandi"])
var morgue = defineJunction("morgue",[0,1,7],["admin","lab","admin"],["angelo"])
var lab = defineJunction("lab",[7],["morgue"],["phelicia"])
var Junctions = {
		"reception" : reception,
		"receptionDesk" : receptionDesk,
		"patient1" : patient1,
		"patient2" : patient2,
		"hallway" : hallway,
		"bathroom" : bathroom ,
		"surgery" : surgery,
		"breakroom" : breakroom,
		"cafeteria" : cafeteria,
		"admin" : admin,
		"morgue" : morgue,
		"lab" : lab,
}
	
	#we start off in reception room
var activeJunction = Junctions["reception"]

func _init() -> void:

	pass

	
	
