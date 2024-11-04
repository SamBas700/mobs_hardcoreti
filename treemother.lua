
local S = minetest.get_translator("mobs_hardcoreti")

-- Treemother by Sambas

mobs:register_mob("mobs_hardcoreti:treemother", {
	type = "monster",
	passive = false,
	damage = 10,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_monster:tree_monster",
	shoot_offset = 2,
	hp_min = 50,
	hp_max = 60,
	armor = 80,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 3, 0.5},
	visual_size = {x = 30, y = 30},
	visual = "mesh",
	mesh = "treemother.b3d",
	textures = {
		{"oak.png"},
	},
	blood_texture = "default_mese_crystal_fragment.png",
	makes_footstep_sound = false,
	sounds = {
		random = "treem",
		death = "treem",
		damage = "treem",
	},
	view_range = 10,
	walk_velocity = 0,
	run_velocity = 0,
	jump = true,
	jump_height = 8,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 2.1,
	drops = {
		{name = "default:apple", chance = 1, min = 10, max = 34},
		{name = "default:mese_crystal_fragment", chance = 1, min = 1, max = 9},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
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
	name = "mobs_hardcoreti:treemother",
	nodes = {"default:leaves", "default:dirt_with_grass"},
	interval = 2,
	chance = 10, -- 10
	day_toggle = true,
})

mobs:register_egg("mobs_hardcoreti:treemother", S("Tree mother"), "wool_brown.png", 1)

-- compatibility
mobs:alias_mob("mobs:mese_monster", "mobs_hardcoreti:mese_monster")

-- mese arrow (weapon)
mobs:register_arrow("mobs_hardcoreti:wendigo", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"default_mese_crystal_fragment.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})

-- 9x mese crystal fragments = 1x mese crystal
minetest.register_craft({
	output = "default:mese_crystal",
	recipe = {
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
	}
})
