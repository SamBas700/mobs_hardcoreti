
local S = minetest.get_translator("mobs_hardcoreti")

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
		{name = "mobs_hardcoreti:it1", chance = 4, min = 1, max = 1},
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


minetest.register_craft({
	output = "mobs_hardcoreti:amethyst",
	recipe = {
		{"default:gold_ingot", "default:mese_crystal", "default:gold_ingot"},
		{"default:diamond", "default:iron_lump", "default:diamond"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	}
})

minetest.register_craftitem("mobs_hardcoreti:amethyst", {
	description = S("Amethyst"),
	inventory_image = "amethyst.png",
})



minetest.register_craft({
	output = "mobs_hardcoreti:bertha",
	recipe = {
		{"mobs_hardcoreti:amethyst", "default:mese_crystal", "mobs_hardcoreti:amethyst"},
		{"mobs_hardcoreti:amethyst", "mobs_hardcoreti:amethyst", "mobs_hardcoreti:amethyst"},
		{"", "default:stick", ""},
	}
})

minetest.register_tool("mobs_hardcoreti:bertha", {
	description = S("Bertha"),
	inventory_image = "bertha.png",
	tool_capabilities = {
		full_punch_interval = 6,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=150},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1, flammable = 2}
})

minetest.register_craft({
	output = "mobs_hardcoreti:amethystpickaxe",
	recipe = {
		{"default:diamond", "default:diamond", "default:diamond"},
		{"mobs_hardcoreti:amethyst", "default:stick", "mobs_hardcoreti:amethyst"},
		{"", "default:stick", ""},
	}
})



minetest.register_tool("mobs_hardcoreti:amethystpickaxe", {
	description = S("Amethyst pickaxe"),
	inventory_image = "amat.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=10, maxlevel=30},
		},
		damage_groups = {fleshy=1},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 0.1}
})


minetest.register_craft({
	output = "mobs_hardcoreti:green",
	recipe = {
		{"mobs_hardcoreti:amethyst", "default:diamond", "mobs_hardcoreti:amethyst"},
		{"default:mese_crystal", "mobs_hardcoreti:it1", "default:mese_crystal"},
		{"mobs_hardcoreti:amethyst", "default:mese_crystal", "mobs_hardcoreti:amethyst"},
	}
})

minetest.register_craftitem("mobs_hardcoreti:green", {
	description = S("Green Crystal"),
	inventory_image = "green2.png",
})


minetest.register_craft({
	output = "mobs_hardcoreti:infecteddungeonmaster",
	recipe = {
		{"mobs_hardcoreti:amethyst", "default:diamond", "mobs_hardcoreti:amethyst"},
		{"default:mese_crystal", "mobs_hardcoreti:it1", "default:mese_crystal"},
		{"mobs_hardcoreti:amethyst", "mobs_hardcoreti:green", "mobs_hardcoreti:amethyst"},
	}
})


minetest.register_craftitem("mobs_hardcoreti:it1", {
	description = S("The stone of youth"),
	inventory_image = "it1.png",
})


minetest.register_node("mobs_hardcoreti:it2", {
	description = S("Creeper torch"),
	drawtype = "plantlike",
	waving = 0,
	light_source = 100,
	tiles = {"it2.png"},
	inventory_image = "it2.png",
	wield_image = "it2.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, grass = 1,
		fern = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
})


minetest.register_craftitem("mobs_hardcoreti:it3", {
	description = S("The enlivening sheet"),
	inventory_image = "sheet.png",
})


minetest.register_craft({
	output = "mobs_hardcoreti:minigolem",
	recipe = {
		{"mobs_hardcoreti:green", "mobs_hardcoreti:it1", "mobs_hardcoreti:amethyst"},
		{"mobs_hardcoreti:it3", "mobs_hardcoreti:it1", "mobs_hardcoreti:it3"},
		{"mobs_hardcoreti:amethyst", "mobs_hardcoreti:it3", "mobs_hardcoreti:amethyst"},
	}
})


minetest.register_craft({
	output = "mobs_hardcoreti:it2",
	recipe = {
		{"", "default:coal_lump", ""},
		{"", "dye:green", ""},
		{"", "default:stick", ""},
	}
})
