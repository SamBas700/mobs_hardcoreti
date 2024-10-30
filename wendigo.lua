
local S = mobs.intllib

-- Dungeon Master by PilzAdam

mobs:register_mob("mobs_hardcoreti:wendigo", {
	type = "monster",
	passive = false,
	damage = 4,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 10,
	reach = 3,
	shoot_interval = 2.5,
	arrow = "mobs_monster:fireball",
	shoot_offset = 1,
	hp_min = 12,
	hp_max = 35,
	armor = 60,
	collisionbox = {-0.7, -0.1, -0.7, 0.7, 3, 0.7},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "wendigo.b3d",
	textures = {
		{"wendigo.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dungeonmaster",
		shoot_attack = "mobs_fireball",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:mese_crystal_fragment", chance = 1, min = 1, max = 3},
		{name = "default:diamond", chance = 4, min = 1, max = 1},
		{name = "default:mese_crystal", chance = 2, min = 1, max = 2},
		{name = "default:diamondblock", chance = 30, min = 1, max = 1},
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
	name = "mobs_hardcoreti:wendigo",
	nodes = {"default:dirt_with_snow", "default:snow", "default:snowblock"},
	chance = 1, -- 10
})

mobs:register_egg("mobs_hardcoreti:wendigo", S("Wendigo"), "fire_basic_flame.png", 1)

-- compatibility
mobs:alias_mob("mobs:wendigo", "mobs_monster:wendigo")

-- fireball (weapon)
mobs:register_arrow("mobs_monster:fireball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_fireball.png"},
	velocity = 6,
--	tail = 1,
--	tail_texture = "mobs_fireball.png",
--	tail_size = 10,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})
