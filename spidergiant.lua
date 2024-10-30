
local S = mobs.intllib

-- Mese Monster by Zeg9

mobs:register_mob("mobs_hardcoreti:spidergiant", {
	type = "monster",
	passive = false,
	damage = 3,
	attack_type = "shoot",
	shoot_interval = 0.5,
	arrow = "mobs_monster:spider",
	shoot_offset = 2,
	hp_min = 134,
	hp_max = 160,
	armor = 80,
	collisionbox = {-0.5, -0.1, -0.5, 0.5, 2, 0.5},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "spidergiant.b3d",
	textures = {
		{"spg.png"},
		{"spg2.png"},
		{"spg3.png"},
	},
	blood_texture = "default_mese_crystal_fragment.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_spidergiant",
		death = "emperorscorpion_death",
		damage = "mobs_spidergiant",
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
		{name = "default:diamond", chance = 1, min = 12, max = 16},
		{name = "default:mese_crystal_fragment", chance = 1, min = 1, max = 9},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 20,
		stand_end = 36,
		walk_start =0,
		walk_end = 16,
		run_start = 0,
		run_end = 16,
		punch_start = 40,
		punch_end = 63,
	},
})

mobs:spawn({
	name = "mobs_hardcoreti:spidergiant",
	nodes = {"default:stone"},
	interval = 2,
	chance = 1, -- 10
})

mobs:register_egg("mobs_hardcoreti:spidergiant", S("Spidergiant"), "default_mese_block.png", 1)

-- compatibility
mobs:alias_mob("mobs:spidergiant", "mobs_hardcoreti:spidergiant")

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
