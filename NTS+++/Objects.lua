local ChairID = "prop_chair"

function onLoad()
    waitTillFullyLoaded()
end

function waitTillFullyLoaded()
    if game.initialized == true then
        NTS.AddCustomSpawner(ChairID, "chairCallback", "Chair") -- 1st is ID, 2nd is Callback, 3rd is Button name
        return
    end
    if game.initialized ~= true then
        waitTillFullyLoaded()
    end
end

function chairCallback() -- uses the call back
    for i, object in ipairs(custom_spawners) do
        if object[1] == ChairID then -- replace ChairID variable
            saveInt("NTS-Spawner-ModeCS", object[4])
            saveInt("NTS-Spawner-Mode", -10)
        end
    end
end