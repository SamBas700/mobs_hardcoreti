
local S = mobs.intllib

-- Present by SamBas

mobs:register_mob("mobs_hardcoreti:present", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 140,
	hp_min = 1,
	hp_max = 1,
	armor = 100,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 2, 0.4},
	visual_size = {x = 4, y = 4},
	visual = "mesh",
	mesh = "present.b3d",
	textures = {
		{"mobs_present.png"},
	},
	blood_texture = "default_iron_lump.png",
	makes_footstep_sound = true,
	sounds = {
		death = "mobs_present",
	},
	view_range = 15,
	walk_velocity = 2,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "default:gold_lump", chance = 1, min = 13, max = 20},
		{name = "mobs_monster:land_guard", chance = 1, min = 1, max = 1},
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
	name = "mobs_hardcoreti:present",
	nodes = {"default:dirt_with_grass", "ethereal:gray_dirt"},
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:present", S("Present"), "default_brick.png", 1)

-- compatibility
mobs:alias_mob("mobs:present", "mobs_hardcoreti:present")
