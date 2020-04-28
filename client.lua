--[[ 
THIS IS A TOP SECRET SCRIPT THAT IS TOP TOP SECRET ONLY REAL TRUE ROLEPLAYERS WILL BE ABLE TO 
DECODE AND USE THIS IN THEIR SERVER FOR AMAZING IMMERSIVE STUFF!! 
]]

local superimmersiveamazingroleplayactivated = true
local co2 = false
local gasp = false
local heartissues = false
local hastobreath = false
local chancetobreath = false
missedbreath = 0
local timebetween = 6 * 1000
local waitbetweenallowing = 4 * 1000
RegisterNetEvent('cl-breathing:breath')
AddEventHandler('cl-breathing:breath', function()
co2 = true
gasp = true
-- exports['mythic_notify']:DoHudText('inform', 'You just took a big breath')
TriggerEvent('notification', 'You just took a big breath', 1, 3000)
missedbreath = 0
Citizen.Wait(waitbetweenallowing)
co2 = false
gasp = false
heartissues = false
end)

RegisterNetEvent('cl-breathing:nobreath')
AddEventHandler('cl-breathing:nobreath', function()
    heartissues = true
 --   exports['mythic_notify']:DoHudText('inform', 'You NEED TO BREATH!!! FOR RP!!!')
 TriggerEvent('notification', 'You NEED TO BREATH!!! FOR RP!!!', 1, 3000)
    Citizen.Wait(10000)

end)

RegisterNetEvent('cl-breathing:prompt')
AddEventHandler('cl-breathing:prompt', function() 
    hastobreath = false
    chancetobreath = true
  --  exports['mythic_notify']:DoHudText('inform', 'Press [E] to breath')
  if missedbreath == 0 then
  TriggerEvent('notification', 'Press [E] To Breath', 1, 3000)
  elseif missedbreath == 1 then
  --  exports['mythic_notify']:DoHudText('inform', 'BREATH YOU GOING TO DIE Press [E] To Breath')
    TriggerEvent('notification', 'BREATH YOU GOING TO DIE Press [E] To Breath', 1, 3000)
  elseif missedbreath == 2 then
 --   exports['mythic_notify']:DoHudText('inform', 'You are gasping for air Press [E] To Breath')
    TriggerEvent('notification', 'You are gasping for air Press [E] To Breath', 1, 3000)
  elseif missedbreath == 3 then
    TriggerEvent('notification', 'YOUR ATTEMPTING SUICIDE?!?!? Press [E] To Breath', 1, 3000)
  --  exports['mythic_notify']:DoHudText('inform', 'YOUR ATTEMPTING SUICIDE?!?!? Press [E] To Breath')
  elseif missedbreath >= 4 then
      --  exports['mythic_notify']:DoHudText('inform', 'YOUR ATTEMPTING SUICIDE?!?!? Press [E] To Breath')
    TriggerEvent('notification', 'YOUR ATTEMPTING SUICIDE?!?!? Press [E] To Breath', 1, 3000)
  else
    return
  end
  if gasp == false then
    missedbreath = missedbreath + 1
  end
    Citizen.Wait(10000)
    hastobreath = true
    chancetobreath = false

end)

RegisterNetEvent('cl-breathing:suicide')
AddEventHandler('cl-breathing:suicide', function()
heartissues = true
co2 = false
SetEntityHealth(GetPlayerPed(-1), 0)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if superimmersiveamazingroleplayactivated == true then
            Citizen.Wait(timebetween)
            print('we made it here')
            hastobreath = true
            if not co2 and not heartissues and hastobreath then
                --- Prompt to Breath
                TriggerEvent('cl-breathing:prompt')
                if missedbreath == 1 then
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.07)
                elseif missedbreath == 2 then
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12)
                elseif missedbreath == 3 then
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
                    Citizen.Wait(1000)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
                                        Citizen.Wait(1000)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.25)
                elseif missedbreath == 4 then
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.57)
                    Citizen.Wait(1000)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.57)
                    Citizen.Wait(1000)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.57)
                elseif missedbreath == 5 then
                    TriggerEvent('cl-breathing:suicide')
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
                end
                print('we have been prompted')    
            end
            if co2 then
                co2 = false
                gasp = false
                heartissues = false
            end
            if hastobreath and heartissues then
                exports['mythic_notify']:DoHudText('inform', 'You have died')
                heartissues = false
                print('we have been prompted with heart issues')    
            end

        end
    end

end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if chancetobreath then
            if IsControlJustPressed(1, 38) and not gasp then
                TriggerEvent('cl-breathing:breath')
            end

        end

    end
end)