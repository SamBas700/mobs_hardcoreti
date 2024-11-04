
local S = mobs.intllib

-- WTF by SamBas

mobs:register_mob("mobs_hardcoreti:wtf", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 140,
	hp_min = 20,
	hp_max = 32,
	armor = 100,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 1.3, 0.4},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "wtf.b3d",
	textures = {
		{"wtf.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	sounds = {
		random = "wtf_living",
		death = "alo_death",
		damage = "duck_hurt",
	},
	view_range = 15,
	walk_velocity = 2,
	run_velocity = 2,
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
	name = "mobs_hardcoreti:wtf",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt"},
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:wtf", S("Wtf"), "wtf.png", 1)

-- compatibility
mobs:alias_mob("mobs:wtf", "mobs_hardcoreti:wtf")
