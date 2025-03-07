local dmgmulti = 1
local spawnrowone = {"zombie", "relic", "orb", "dragon fruit"}
local spawnrowtwo =  { "sphere", "test enemy", "perm wisp", "slimes" }
local spawnrowthree = { "coins x5", "keys x5", "the beast" }
local nodmg = false
function onModSettingsInit(settingsObject)
    settingsObject.Header("<color=#FF0000>Spawners</color>")
    settingsObject.Buttons("<color=#00FF00>Row 1</color>", "settingsNamespawnermodeoneCallback", 1, spawnrowone)
    settingsObject.Buttons("<color=#00FF00>Row 2</color>", "settingsNamespawnermodetwoCallback", 1, spawnrowtwo)
    settingsObject.Buttons("<color=#00FF00>Row 3</color>", "settingsNamespawnermodethreeCallback", 1, spawnrowthree)
    settingsObject.Header("<color=#FF0000>Abilities</color>")
    settingsObject.Buttons("<color=#00FFFF>speed</color>", "settingsNamespeedCallback", 1, {"speed"})
    settingsObject.Buttons("<color=#FFFF00>boss tp</color>", "settingsNamebossCallback", 1, {"tp mark"})
    settingsObject.Buttons("<color=#FFFF00>No DMG</color>", "settingsNamedmgCallback", 1, {"off", "on"})
    settingsObject.Header("<color=#FF0000>Misc</color>")
    settingsObject.Slider("<color=#FFFF00>Damage Multiplyer</color>", "settingsNamedmgCallback", 1, 1000, dmgmulti)
end

function settingsNamespawnermodeoneCallback(buttonIndex)
    if buttonIndex == 0 then
        pickup = game.itemInterpreter.GetPickupById("zombie-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 1 then
        pickup = game.itemInterpreter.GetPickupById("relic-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 2 then
        pickup = game.itemInterpreter.GetPickupById("orb-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 3 then
        pickup = game.itemInterpreter.GetPickupById("drg-fruit-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
end

function settingsNamespawnermodetwoCallback(buttonIndex)
    if buttonIndex == 0 then
        pickup = game.itemInterpreter.GetPickupById("sphere-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 1 then
        pickup = game.itemInterpreter.GetPickupById("tst-eny-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 2 then
        pickup = game.itemInterpreter.GetPickupById("prm-wsp-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 3 then
        pickup = game.itemInterpreter.GetPickupById("slime-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
end

function settingsNamespawnermodethreeCallback(buttonIndex)
    if buttonIndex == 0 then
        pickup = game.itemInterpreter.GetPickupById("coin-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 1 then
        pickup = game.itemInterpreter.GetPickupById("keys-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
    if buttonIndex == 2 then
        pickup = game.itemInterpreter.GetPickupById("beast-spawner")
        pickup.Execute("onPickup", nil)
        pickup.OnPickup()
    end
end

function settingsNamedmgCallback(value)
    dmgmulti = value
end

function onMeleeHitEntity(infos)
	return infos.damage * dmgmulti
end

function onRangedHitEntity(infos)
	return infos.damage * dmgmulti
end

function settingsNamebossCallback(buttonIndex)
    pickup = game.itemInterpreter.GetPickupById("boss-tp")
    pickup.Execute("onPickup", nil)
    pickup.OnPickup()
end

function settingsNamespeedCallback(buttonIndex)
    pickup = game.itemInterpreter.GetPickupById("speed")
    pickup.Execute("onPickup", nil)
    pickup.OnPickup()
end

function onPlayerHit(playerDamage)
    if nodmg == true then
        return 0
    end
    return playerDamage
end

function settingsNamedmgCallback(buttonIndex)
    if buttonIndex == 0 then
         nodmg = false
    end
    if buttonIndex == 1 then
        nodmg = true
   end
end