function onLoad()
	pickup.name = "spawner"
	pickup.desc = "Once charged, use to spawn something of your choise"
	pickup.probability = 0
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 45
	pickup.tier = 2
	pickup.spawnsIn = {"podest", "shop", "boss"}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function onPickup()
	pickup.registerUsable()
end

function teleportPlayer(pos, rot)
	game.TeleportTo(pos, true)
	game.FaceInDir(360 - rot)
	callFunctionIn("afterTeleport", 2.0)
end

function afterTeleport()
	player.playerHitEffect.FadeScreen(false)
	game.playerController.useGravity = true
end

function recharge()
	pickup.currentCharge = 9999
	game.activePickupSlot.UpdateChargeDisplay()
end


function onPickupActivate()
	if loadValue("NTS-Spawner-Mode") == 1 then
		game.spawnObjectNetwork("enemy_og_wight", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 2 then
		game.spawnObjectNetwork("enemy_ns_slime", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 3 then
		game.spawnObjectNetwork("enemy_gm_skeleton", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 4 then
		game.spawnObjectNetwork("enemy_bc_skull_darkness", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 5 then
		game.spawnObjectNetwork("item_upgrade_all", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 6 then
		game.spawnObjectNetwork("item_orb", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 7 then
		game.spawnObjectNetwork("item_food_dragonfruit", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 8 then
		game.spawnObjectNetwork("item_food_cheese", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 9 then
		game.spawnObjectNetwork("companion_wisp_invincible", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 10 then
		game.spawnObjectNetwork("item_key", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_key", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_key", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_key", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_key", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 11 then
		game.spawnObjectNetwork("item_coin", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_coin", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_coin", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_coin", game.playerController.rightHand.transform.position)
		game.spawnObjectNetwork("item_coin", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 12 then
		game.spawnObjectNetwork("item_ethereal_heart", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 13 then
		game.spawnObjectNetwork("boss_king_slime", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 14 then
		game.spawnObjectNetwork("boss_deranged_adventurer", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 15 then
		game.spawnObjectNetwork("boss_book", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 16 then
		game.spawnObjectNetwork("boss_the_beast", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 17 then
		game.spawnObjectNetwork("enemy_test", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 18 then
		game.spawnObjectNetwork("test_sphere", game.playerController.rightHand.transform.position)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 19 then
		game.spawnObjectNetwork("player_teleport_particles", player.transform.position)
		allRooms = game.currentWorldGenerator.GetAllRoomsInWorldAsList()

		local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position)
		if room == nil then
			callFunctionIn("recharge", 1)
			return
		end

		if room.type == "boss" or room.type == "afterboss_start" or room.type == "start" or room.type == "challenge" then
			audio.playSoundLocal("error", player.transform.position)
			callFunctionIn("recharge", 1)
			return
		end

		for _, room in ipairs(allRooms) do
			if room.type == "boss" then 
				tilesOfShop = room.baseTiles
				for _, tile in ipairs(tilesOfShop) do
					if tile.isDoor then
						doorPos = tile.pos
						game.playerController.useGravity = false
						player.playerHitEffect.FadeScreen(true, 2.0)
						teleportTargetPos = room.GetWorldPosBase() + vector3.__new(0,1,0) + vector3.__new(doorPos.x * 4, 0, doorPos.y * 4)
						callFunctionIn("teleportPlayer", 0.5, teleportTargetPos, room.rotation)
					end
				end
				return
			end
		end
		return
	end

	if loadValue("NTS-Spawner-Mode") == 20 then
		player.MoveSpeed.RegisterMultiplier(pickup.id, 2)
		return
	end

	if loadValue("NTS-Spawner-Mode") == 21 then
		local enemy = game.spawnObjectNetwork("enemy_gm_skeleton", game.playerController.rightHand.transform.position)
		local gameObject = enemy.gameObject
		local enemyBase = getComponent(gameObject, "EnemyBase")
		enemyBase.MaxHealth = loadValue("skl-maxhealth")
        enemyBase.Health = loadValue("skl-maxhealth")
		return
	end

	if loadValue("NTS-Spawner-Mode") == 22 then
		local enemy = game.spawnObjectNetwork("enemy_og_slime_bullet", game.playerController.rightHand.transform.position)
		local gameObject = enemy.gameObject
		local enemyBase = getComponent(gameObject, "EnemyBase")
		enemyBase.MaxHealth = loadValue("skl-maxhealth")
        enemyBase.Health = loadValue("skl-maxhealth")
		return
	end

	if loadValue("NTS-Spawner-Mode") == 23 then
		local orb = game.SpawnObjectNetwork("item_upgrade_all", game.playerController.rightHand.transform.position)
		local itembase = getComponent(orb, "ItemUpgrade")
		itembase.forceSpawn = "erthu_chrwa_pit_friend"
		return
	end

	if loadValue("NTS-Spawner-Mode") == 24 then
		local orb = game.SpawnObjectNetwork("item_upgrade_all", game.playerController.rightHand.transform.position)
		local itembase = getComponent(orb, "ItemUpgrade")
		itembase.forceSpawn = "sebwr_ginseng_root"
		return
	end

	if loadValue("NTS-Spawner-Mode") == 25 then
		local orb = game.SpawnObjectNetwork("item_upgrade_all", game.playerController.rightHand.transform.position)
		local itembase = getComponent(orb, "ItemUpgrade")
		itembase.forceSpawn = "erthu_chrwa_charm_of_a_first_love"
		return
	end

	for i, object in ipairs(custom_spawners) do
		if loadValue("NTS-Spawner-ModeCS") == object[4] then
			game.SpawnObjectNetwork(object[1], game.playerController.rightHand.transform.position)
		end
	end

	debugLog("NTS-Error: mode not found")
end