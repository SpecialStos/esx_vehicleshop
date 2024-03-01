ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, plate)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice = getVehicleFromModel(model).price

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice, "Vehicle Purchase")

		local data = {
				source = src, --Who is the source. Send the Player ID. Also make sure it is number!
				hash = GetHashKey(model), --The hash number of the vehicle
				coords = vector4(-31.74, -1090.91, 26.41, 340.15), --This is a vector 4 location. Inlcludes x,y,z,heading.
				identifier = xPlayer.getIdentifier(), --Requires the owner of the vehicle. (Player.PlayerData.citizenid - QBCORE)
				vehicleName = model, --The name of the vehicle in a string format - ("adder")
		}
		TriggerEvent("realisticVehicleSystem:server:addVehicle", 1, data)
	else
		cb(false)
	end
end)