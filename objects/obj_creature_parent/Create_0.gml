xspd = 0
yspd = 0

level = 1

attrStrength = 5
attrSpeed = 5
attrEndurance = 5
attrIntelligence = 5
attrLuck = 5

attrStrengthPrevious = attrStrength
attrSpeedPrevious = attrSpeed
attrEndurancePrevious = attrEndurance
attrIntelligencePrevious = attrIntelligence
attrLuckPrevious = attrLuck

attributes = [
	attrStrength, attrSpeed, attrEndurance, attrIntelligence, attrLuck
]

attributesPrevious = [
	attrStrengthPrevious, attrSpeedPrevious, attrEndurancePrevious, attrIntelligencePrevious, attrLuckPrevious
]

skillBlade = 1
skillAxe = 1
skillBlunt = 1
skillSpear = 1
skillTwoHanded = 1
skillOneHanded = 1
skillUnarmed = 1

skillHeavyArmor = 1
skillLightArmor = 1

skillMagic = 1

skills = [
	skillAxe, skillBlade, skillBlunt, skillSpear, skillTwoHanded, skillOneHanded, skillUnarmed,
	skillHeavyArmor, skillLightArmor,  
	skillMagic
]

ogMove_spd = 0.08*attrSpeed
move_spd = ogMove_spd

global.wall_list = [
	obj_wall_parent,
	obj_pushable_parent
];

baseHealth = 20*attrStrength
maxHealth = baseHealth
currHealth = maxHealth

baseStamina = 16*attrEndurance
maxStamina = baseStamina
currStamina = maxStamina
staminaRegen = 0.3

baseMagicka = 10*attrIntelligence
maxMagicka = baseMagicka
currMagicka = maxMagicka
magickaRegen = 0.01

baseMeleeDamage = attrStrength
meleeDamage = baseMeleeDamage

knockbackSpeed = 2
ogKnockbackTime = 4
knockbackTime = ogKnockbackTime

ogStunTime = 5
stunTime = ogStunTime

hitDirection = 0

sprite[RIGHT] = undefined;
sprite[DOWN] = undefined;
sprite[LEFT] = undefined;
sprite[UP] = undefined;

face = DOWN;

state = "none"

inventory = array_create(0, -1)
equippedItem = undefined

equippedHead = undefined
equippedChest = undefined
equippedLegs = undefined
equippedFootRight = undefined
equippedFootLeft = undefined
equippedShoulderRight = undefined
equippedShoulderLeft = undefined
equippedArmRight = undefined
equippedArmLeft = undefined

onWeb = false

//calculating stats
function recalculate_stats()
	{
	image_speed = attrSpeed/4
	
	baseHealth = 20*attrStrength
	maxHealth = baseHealth
	
	baseStamina = 16*attrEndurance
	maxStamina = baseStamina
	
	baseMagicka = 10*attrIntelligence
	maxMagicka = baseMagicka
	
	move_spd = 0.08*attrSpeed
	
	baseMeleeDamage = attrStrength
	
	if object_index == obj_enemy_spider
		{jump_spd = attrSpeed/2}
	}