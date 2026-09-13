local config = require("config")
local lock = {}

function lock.auth()
	io.write("Enter password: ")
	local input = io.read()

	if input == config.password then
		print("Welcome to MeowShell.")
		return true
	else
		print("Access denied. Incorrect password.")
		return false
	end
end

return lock
