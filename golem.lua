
local S = mobs.intllib

-- Golem by SamBas

mobs:register_mob("mobs_hardcoreti:golem", {
	type = "monster",
	passive = false,
	damage = 3,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_monster:stone_monster",
	shoot_offset = 2,
	hp_min = 10,
	hp_max = 25,
	armor = 80,
	collisionbox = {-0.5, -0.1, -0.5, 0.5, 4, 0.5},
	visual_size = {x = 20, y = 20},
	visual = "mesh",
	mesh = "golem.b3d",
	textures = {
		{"golem.png"},
		{"golem2.png"},
	},
	blood_texture = "default_mese_crystal_fragment.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_mesemonster",
	},
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	jump = true,
	jump_height = 8,
	fall_damage = 0,
	fall_speed = -6,
	stepheight = 2.1,
	drops = {
		{name = "default:mese_crystal", chance = 9, min = 1, max = 3},
		{name = "default:mese_crystal_fragment", chance = 1, min = 1, max = 9},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
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
	name = "mobs_hardcoreti:golem",
	nodes = {"default:stone"},
	max_light = 7,
	interval = 2,
	chance = 10, -- 10
})

mobs:register_egg("mobs_hardcoreti:golem", S("Golem"), "default_iron_lump.png", 1)

-- compatibility
mobs:alias_mob("mobs:golem", "mobs_hardcoreti:golem")

-- mese arrow (weapon)
mobs:register_arrow("mobs_monster:fireball", {
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
