local QBCore = exports['qb-core']:GetCoreObject()


PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    -- print(PlayerData.company.onduty)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('opentrcermenu')
AddEventHandler('opentrcermenu', function()
    -- يتم تنفيذ هذا الجزء عند استلام الحدث 'opentrcermenu'
    if PlayerData.job.name == "police" then
        local truckernub = exports['qb-input']:ShowInput({
            header = "Tracker Phone System",
            submitText = "Submit",
            inputs = {
                {
                    text = "phone number",
                    name = "phonetrar", 
                    type = "number",
                    isRequired = true
                },
                {
                    text = "Some Select",
                    name = "someselect",
                    type = "select",
                    options = {
                        { value = "Tracker", text = "Tracker" },
                        { value = "cancel", text = "Cancel" },
                    },
                }
            },
        })

        if truckernub then
            if truckernub.someselect == "Tracker" then
                TriggerServerEvent('opentrac', truckernub)
            elseif truckernub.someselect == "cancel" then
                TriggerServerEvent("cancelblblb")
            end
        end
    end
end)


RegisterNetEvent('Dc:client:SendTrackerLocation', function(requestId)
    local ped = PlayerPedId()
     coords = GetEntityCoords(ped)

    TriggerServerEvent('Dc:server:ggad1' , requestId)

end)




RegisterNetEvent('Dc:client:truckenabt', function(coords)
    local Player = QBCore.Functions.GetPlayerData()
     currentPos = GetEntityCoords(PlayerPedId())
    if Player.job.name == "police" then

    local radius = 180.0
    local blip = AddBlipForRadius(coords.x, coords.y , coords.z, radius)
    SetBlipAlpha(blip, 128) 
    SetBlipColour(blip, 1) 
    SetBlipHighDetail(blip, true) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("test")
    EndTextCommandSetBlipName(blip)
    Citizen.CreateThread(function()
     Citizen.Wait(15000)
     RemoveBlip(blip)
    end)
    end
end)
RegisterNetEvent('Dc:client:testruckenabt111', function(coords,src)

    exports["memorygame"]:thermiteminigame(6, 1, 3, 15,
    function() -- success
        print("success")
    end,
    function() -- failure
        TriggerServerEvent('Dc:server:ggad2' , requestId)
    end)

end)


