
local S = mobs.intllib

-- Erepede by SamBas

mobs:register_mob("mobs_hardcoreti:strider", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 12,
	hp_min = 20,
	hp_max = 32,
	armor = 100,
	collisionbox = {-1, -0.1, -1, 1, 10, 1},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "strider.b3d",
	textures = {
		{"strider.png"},
		{"strider2.png"},
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
		{name = "mobs_hardcoreti:stridertreat", chance = 1, min = 1, max = 2},
	},
	water_damage = 0,
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
	name = "mobs_hardcoreti:strider",
	nodes = {"default:water", "default:river_water", "default:water_source", "default:river_water_source"},
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:strider", S("Strider"), "strider.png", 1)

-- compatibility
mobs:alias_mob("mobs:strider", "mobs_hardcoreti:strider")



minetest.register_craftitem("mobs_hardcoreti:stridertreat", {
	description = S("Strider treat"),
	inventory_image = "stridertreat.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=1100},
	},
	--on_use = minetest.item_eat(15),
})
