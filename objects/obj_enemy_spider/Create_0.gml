// Inherit the parent event
event_inherited();

web_locations = undefined

sprite[RIGHT] = spr_spider;
sprite[DOWN] = spr_spider;
sprite[LEFT] = spr_spider;
sprite[UP] = spr_spider;

attrStrength = 2
attrSpeed = 6
attrEndurance = 4
attrIntelligence = 2
attrLuck = 5

ogAttackTime = 0
attackTime = ogAttackTime

baseHealth = 20*attrStrength
maxHealth = baseHealth
currHealth = maxHealth

baseStamina = 16*attrEndurance
maxStamina = baseStamina
currHealth = maxHealth

baseMagicka = 10*attrIntelligence
maxMagicka = baseMagicka
currMagicka = maxMagicka

magickaDamage = 10

meleeDamage = attrStrength*2

jump_spd = 0

home_web = array_create(0, -1)

ogWebLength = 0
webLength = ogWebLength
firstRun = 2

pathTiming = false
ogPathTimer = 10
pathTimer = ogPathTimer

//initializes home web based on one web
function run()
	{
	for (var i = 0; i < array_length(home_web); i++)
		{
		ogWebLength = webLength
		webLength = array_length(home_web)
		for (var e = 0; e < array_length(home_web[i].neighbors); e++)
			{
			var neighbors = home_web[i].neighbors
			if neighbors[e] != -1 && !array_contains(home_web, neighbors[e].id) && neighbors[e].object_index = obj_web
				{array_push(home_web, neighbors[e].id); webLength = array_length(home_web)}
			}
		if i == array_length(home_web) - 1
			{
			if webLength != ogWebLength
				{run()}
			}
		}
	}

//find random web within home web and return it	
function findWeb()
	{
	home_web = array_shuffle(home_web)
	var target = home_web[irandom(array_length(home_web) - 1)]
	while !instance_exists(target)
		{target = home_web[irandom(array_length(home_web) - 1)]}
	return target
	}