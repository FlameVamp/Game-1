// Inherit the parent event
event_inherited();

sprite[RIGHT] = spr_vampire;
sprite[DOWN] = spr_vampire;
sprite[LEFT] = spr_vampire;
sprite[UP] = spr_vampire;

target_rdm_x = random_range(-4, 4)
target_rdm_y = random_range(-4, 4)

head = undefined


attrStrength = 4
attrSpeed = 5
attrEndurance = 5
attrIntelligence = 4
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

latchDir = undefined

meleeDamage = attrStrength*2


function unlatch()
	{
	latchDir = undefined
	if head != undefined
		{instance_destroy(head); head = undefined}
	if obj_player.leftLatch = self {obj_player.leftLatch = undefined}
	if obj_player.rightLatch = self {obj_player.rightLatch = undefined}
	
	array_delete(behavior_stack, array_get_index(behavior_stack, "attack"), 1)
	attackCooldown = ogAttackCooldown
	alarm[0] = 1
	}