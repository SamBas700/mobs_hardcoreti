
local S = minetest.get_translator("mobs_hardcoreti")

-- Erepede by SamBas

mobs:register_mob("mobs_hardcoreti:butterfly", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	pathfinding = true,
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 5,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "butterfly.b3d",
	textures = {
		{"bt.png"},
		{"bt2.png"},
		{"bt3.png"},
	},
	blood_texture = "default_sand.png",
	makes_footstep_sound = false,
	sounds = {
		random = "treem",
	},
	view_range = 15,
	walk_velocity = 30,
	run_velocity = 30,
	jump = true,
	drops = {
		{name = "default:iron_lump", chance = 1, min = 10, max = 13},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 16,
		walk_start = 0,
		walk_end = 16,
		run_start = 0,
		run_end = 16,
		punch_start = 0,
		punch_end = 16,
	},
})

mobs:spawn({
	name = "mobs_hardcoreti:butterfly",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt"},
	interval = 0,
	chance = 1000, -- 10
})

mobs:register_egg("mobs_hardcoreti:butterfly", S("Butterfly"), "bt2.png", 1)

-- compatibility
mobs:alias_mob("mobs:butterfly", "mobs_hardcoreti:butterfly")
