
local S = mobs.intllib

-- Dirt Monster by PilzAdam

mobs:register_mob("mobs_hardcoreti:lurker", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 12,
	hp_min = 20,
	hp_max = 32,
	armor = 100,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 0.8, 0.4},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "lurker.b3d",
	textures = {
		{"lurker.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = false,
	sounds = {
		random = "cryo_living",
		death = "alien_death",
		damage = "alo_hurt",
	},
	view_range = 15,
	walk_velocity = 10,
	run_velocity = 10,
	jump = true,
	drops = {
		{name = "default:iron_lump", chance = 1, min = 10, max = 13},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 20,
		stand_end = 30,
		walk_start = 0,
		walk_end = 16,
		run_start = 0,
		run_end = 16,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:spawn({
	name = "mobs_hardcoreti:lurker",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt"},
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:lurker", S("Lurker"), "default_dirt.png", 1)

-- compatibility
mobs:alias_mob("mobs:lurker", "mobs_hardcoreti:lurker")
