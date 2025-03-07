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

function onPickupActivate()
	game.spawnObjectNetwork("enemy_og_wight", game.playerController.rightHand.transform.position)
end