randomize()
event_inherited()

//sprite assignment
sprite[RIGHT] = spr_player_right;
sprite[DOWN] = spr_player_down;
sprite[LEFT] = spr_player_left;
sprite[UP] = spr_player_up;

//attribute assingment
attrStrength = 5
attrSpeed = 5
attrEndurance = 5
attrIntelligence = 5
attrLuck = 5

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


baseHealth = 100
maxHealth = baseHealth
currHealth = baseHealth

baseStamina = 80
maxStamina = baseStamina
currStamina = baseStamina


baseMagicka = 50
maxMagicka = baseMagicka
currMagicka = baseMagicka



targetDoor = -3

staminaCooling = false
ogStaminaCooldown = 50
staminaCooldown = ogStaminaCooldown

sprintSpeed = 0.75*move_spd
sprintCost = 0.5
sprinting = false

dashSpeed = 2
ogDashDuration = 10
dashDuration = ogDashDuration
dashCost = 25
dashing = false
dashX = 0
dashY = 0
dashed = false

equippedItem = undefined

startingStamina = 0
ogAngle = 45
angle = ogAngle
swing = false
ogAngleMod = -45
angleMod = ogAngleMod

ogSwingCooldown = 7
swingCooldown = ogSwingCooldown
swingCooling = false

lootMenu = undefined
lootMenuOwner = undefined

in_combat = false

pause = false

//heal player health/stamina/magicka
function heal(item, amount)
	{
	if item != undefined
		{
		if item.healHealth
			{if currHealth + amount >= maxHealth {currHealth = maxHealth} else currHealth += amount}
		if item.healStamina
			{if currStamina + amount >= maxStamina {currStamina = maxStamina} else currStamina += amount}
		if item.healMagicka
			{if currMagicka + amount >= maxMagicka {currMagicka = maxMagicka} else currMagicka += amount}
		}
	}