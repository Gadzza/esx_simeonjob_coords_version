-- made by Uwu Hentai | Uwu Hentai#4312
-- converted by Gadzzaa | twitch.tv/gadzzaa#994

 local windows = {
    {-47.72,-1105.52,26.44},
    {-45.0,-1106.52,26.44}
}


Citizen.CreateThread(function()
    Wait(100)
    while true do
        local waittime = 1000
        local player = PlayerPedId()
        local playercoord = GetEntityCoords(player)
        local drytime = 10000  -- In Miliseconds
        dryied = true

        for i,v in pairs(windows) do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v[1],v[2],v[3])

        if distance <= 1.5 then
            waittime = 5
            DrawText3D(v[1],v[2],v[3] + 1.5, '~b~[SIMEON] ~w~Wash these windows if you can! Do not worry! Not free!')  
            DrawText3D(v[1],v[2],v[3] + 1.3, '~b~[SIMEON] ~w~To start press ~g~[E]')  
            if IsControlJustReleased(0, 38) then
                if dryied then
                    dryied = false
                    OpenTrashCan()
                    Wait(drytime)
                    dryied = true
                else
                    notify("~b~[SIMEON] ~o~These windows were already washed!")
                        end
                    end
                end
        end
        Citizen.Wait(waittime)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BUM_WASH", 0, true) -- SITE ANIMATII : https://gtaforums.com/topic/796181-list-of-scenarios-for-peds/
            Wait(10000)
            TriggerServerEvent("gadza:simeonda")
    ClearPedTasks(PlayerPedId())
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end