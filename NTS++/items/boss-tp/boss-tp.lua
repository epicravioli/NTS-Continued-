function onLoad()
	pickup.name = "Rusher's Mark"
	pickup.desc = "Once charged, use to teleport to the boss room"
	pickup.probability = 1
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 0
	pickup.tier = 3
	pickup.spawnsIn = {"goldenChest", "shop"}
	pickup.supportedInMultiplayer = true
	pickup.isActivateItem = true
end

function onPickup()
	pickup.registerUsable()
end

function onPickupActivate()
	allRooms = game.currentWorldGenerator.GetAllRoomsInWorldAsList()
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