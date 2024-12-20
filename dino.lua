
local S = minetest.get_translator("mobs_hardcoreti")

-- Erepede by SamBas

mobs:register_mob("mobs_hardcoreti:dino", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 12,
	hp_min = 60,
	hp_max = 70,
	armor = 100,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 3, 0.4},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "dino.b3d",
	textures = {
		{"dino.png"},
	},
	blood_texture = "default_sand.png",
	makes_footstep_sound = false,
	sounds = {
		random = "trex_living",
		death = "alo_death",
		damage = "trex_living",
	},
	view_range = 15,
	walk_velocity = 3,
	run_velocity = 3,
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
	name = "mobs_hardcoreti:dino",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt"},
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:dino", S("Dino"), "default_papyrus.png", 1)

-- compatibility
mobs:alias_mob("mobs:dino", "mobs_hardcoreti:dino")
