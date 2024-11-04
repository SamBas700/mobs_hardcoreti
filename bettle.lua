
local S = mobs.intllib

-- Spider mother by SamBas

mobs:register_mob("mobs_hardcoreti:bettle", {
	type = "monster",
	passive = false,
	damage = 300,
	attack_type = "dogshoot",
	dogshoot_switch = 0,
	dogshoot_count_max = 10,
	reach = 3,
	shoot_interval = 0.1,
	arrow = "mobs_monster:cobweb",
	shoot_offset = 1,
	hp_min = 200,
	hp_max = 200,
	armor = 60,
	collisionbox = {-0.7, -0.1, -0.7, 0.7, 3, 0.7},
	visual_size = {x = 15, y = 15},
	visual = "mesh",
	mesh = "bettle.b3d",
	textures = {
		{"bet.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dungeonmaster",
		damage = "beebuzz",
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 0,
	run_velocity = 0,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:mese_crystal_fragment", chance = 1, min = 1, max = 3},
		{name = "default:diamond", chance = 4, min = 1, max = 1},
		{name = "default:mese_crystal", chance = 2, min = 1, max = 2},
		{name = "default:diamondblock", chance = 30, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	fear_height = 3,
	animation = {
		stand_start = 31,
		stand_end = 40,
		walk_start = 0,
		walk_end = 16,
		punch_start = 20,
		punch_end = 30,
		shoot_start = 20,
		shoot_end = 30,
		speed_normal = 15,
		speed_run = 16,
	},
})

mobs:spawn({
	name = "mobs_hardcoreti:bettle",
	nodes = {"default:dirt_with_snow", "default:snow", "default:snowblock"},
	chance = 1, -- 10
})

mobs:register_egg("mobs_hardcoreti:bettle", S("Bettle"), "bet.png", 1)

-- compatibility
mobs:alias_mob("mobs:bettle", "mobs_monster:bettle")

-- fireball (weapon)
mobs:register_arrow("mobs_monster:fireball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_fireball.png"},
	velocity = 100,
--	tail = 1,
--	tail_texture = "mobs_fireball.png",
--	tail_size = 10,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.1,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.1,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})
