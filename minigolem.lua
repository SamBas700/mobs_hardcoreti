
local S = minetest.get_translator("mobs_hardcoreti")

-- minigolem by SamBas

mobs:register_mob("mobs_hardcoreti:minigolem", {
	type = "npc",
	passive = false,
	damage = 20,
	attack_type = "dogshoot",
	attack_monsters = true,
	attack_animals = false,
	attack_npcs = false,
	group_attack = true,
	dogshoot_switch = 0,
	dogshoot_count_max = 10,
	reach = 3,
	shoot_interval = 1,
	arrow = "mobs_monster:fireball",
	shoot_offset = 1,
	hp_min = 70,
	hp_max = 70,
	armor = 100,
	collisionbox = {-0.7, -0.1, -0.7, 0.7, 1.6, 0.7},
	visual_size = {x = 10, y = 10},
	visual = "mesh",
	mesh = "minigolem.b3d",
	textures = {
		{"minigolem.png"},
		{"minigolem2.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "robot_living4",
		shoot_attack = "cannon",
		damage = "robot_hurt1",
	},
	walk_velocity = 6,
	run_velocity = 6,
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
		stand_start = 50,
		stand_end = 60,
		walk_start = 0,
		walk_end = 16,
		punch_start = 20,
		punch_end = 35,
		shoot_start = 20,
		shoot_end = 35,
		speed_normal = 15,
		speed_run = 15,
	},
	on_rightclick = function(self, clicker)
		
		-- feed to heal npc
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- by right-clicking owner can switch npc between follow and stand
		if self.owner and self.owner == name then

			if self.order == "follow" then
				self.order = "stand"

				minetest.chat_send_player(name, S("Mini golem stands still."))
			else
				self.order = "follow"
				minetest.sound_play("yes_sir", {
					pos = pos, gain = 1.2, max_hear_distance = 30}, true)

				minetest.chat_send_player(name, S("Mini golem follow you."))
			end
		end
	end,
})


mobs:register_egg("mobs_hardcoreti:minigolem", S("Mini golem"), "minigolem.png", 1)

-- compatibility
mobs:alias_mob("mobs:minigolem", "mobs_hardcoreti:minigolem")

-- fireball (weapon)
mobs:register_arrow("mobs_monster:fireball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_fireball.png"},
	velocity = 25,
--	tail = 1,
--	tail_texture = "mobs_fireball.png",
--	tail_size = 10,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 20},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 20},
		}, nil)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})
