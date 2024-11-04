-- translation and mod path

local S = minetest.get_translator("mobs_hardcoreti")
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"



local function ddoo(mob)

	if minetest.settings:get_bool("mobs_hardcoreti." .. mob) == false then
		print("[mobs_hardcoreti] " .. mob .. " disabled!")
		return
	end

	dofile(path .. mob .. ".lua")
end

-- Hardcoreti

ddoo("golem") -- SamBas700
ddoo("treemother") -- SamBas700
ddoo("spidergiant") -- SamBas700
ddoo("wendigo") -- SamBas700
ddoo("lurker") -- SamBas700
ddoo("robot") -- SamBas700
ddoo("wtf") -- SamBas700
ddoo("erepede") -- SamBas700
ddoo("present") -- SamBas700
ddoo("spidermother") -- SamBas700
ddoo("bullsquid") -- SamBas700
ddoo("butterfly") -- SamBas700
ddoo("dino") -- SamBas700
ddoo("strider") -- SamBas700
ddoo("bettle") -- SamBas700

print (S("[MOD] Mobs Redo 'Hardmobs' loaded"))
