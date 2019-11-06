-- Just a test script

local Serithai
local isSerithaiLoad

Citizen.CreateThread(function()
	isSerithaiLoad = exports['noah_font_export']:isFontLoaded('Serithai')
	
	if not isSerithaiLoad then
		Citizen.Wait(1000)
	end
	
	if isSerithaiLoad then
		Serithai = exports['noah_font_export']:RequestFontID('Serithai')
		
		return
	end
end)

Citizen.CreateThread(function()
    while true do
		if isSerithaiLoad then
		    SetTextFont(Serithai)
			BeginTextCommandDisplayText('STRING')
			AddTextComponentString('สวัสดีแมว')
			EndTextCommandDisplayText(0.5, 0.5)
		end
		
		Citizen.Wait(1)
	end
end)