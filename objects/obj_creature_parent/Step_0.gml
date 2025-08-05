depth = -y

//reset move speed each step
if move_spd != ogMove_spd {move_spd = ogMove_spd}

//calculate attributes
recalculate_stats()

//updating health, stamina, and magicka
if currHealth > maxHealth
	{
	currHealth = maxHealth
	}

if currStamina > maxStamina
	{
	currStamina = maxStamina
	}

if currMagicka > maxMagicka
	{
	currMagicka = maxMagicka
	}

//inventory equipped item check
if instance_exists(equippedItem)
	{
	if equippedItem.owner != self
		{
		equippedItem.owner = self
		}
	}

//death
if currHealth <= 0
	{state = "dead"}

//knockback when hit

//set sprite
if yspd == 0
	{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};

if xspd == 0
	{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];

//move slower when touching webs
	if place_meeting(x, y, obj_web) && !(object_index == obj_enemy_spider) {xspd *= .6; yspd *= .6; onWeb = true}
	else if place_meeting(x, y, obj_web) && (object_index == obj_enemy_spider) {onWeb = true; if instance_exists(target) {if target.object_index != obj_web {move_spd *= 2;}}}
	else if onWeb && !place_meeting(x, y, obj_web) {onWeb = false}
	
//diagonal speed normalization
if xspd != 0 && yspd != 0
{
    xspd *= 0.707;
    yspd *= 0.707;
}

//collisions
var colObjectX = instance_place(x + xspd, y, global.wall_list)
if colObjectX != noone
	{
	if colObjectX.object_index == obj_door
		{if !colObjectX.unlocked {xspd = 0}}
	else {xspd = 0}
	}
var colObjectY = instance_place(x, y + yspd, global.wall_list)
if colObjectY != noone
	{
	if colObjectY.object_index == obj_door
		{if !colObjectY.unlocked {yspd = 0}}
	else {yspd = 0}
	}

if ((xspd != 0 or yspd != 0) or pathing) && particleTimer == ogParticleTimer
		{
		var partSys = part_system_create(part_step)
		var particle = particle_get_info(part_step).emitters[0].parttype.ind;
		part_particles_create(partSys, x, y + (bbox_bottom - y)/2 + 2, particle, 1)
		particleTimer--
		}
else if particleTimer < ogParticleTimer
	{
	if particleTimer <= 0
		{particleTimer = ogParticleTimer}
	else
		{particleTimer--}
	}

x += xspd;
y += yspd;