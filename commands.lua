local config = require("config")
local commands = {}

commands["clear"] = {
    desc = "Clear the terminal's screen",
    fn = function(args)
        os.execute("clear")
    end
}

commands["about"] = {
    desc = "Show information about this shell",
    fn = function(args)
        print(config.shell_name .. ": " .. config.shell_desc)
    end
}

commands["echo"] = {
    desc = "Print plain text to the terminal",
    fn = function(args)
        if args and args ~= "" then
            print(args)
        else
            print("Insert a value.")
        end
    end
}

commands["quit"] = {
    desc = "Exit the shell",
    fn = function(args)
        os.exit()
    end
}

commands["help"] = {
    desc = "Show available commands along their descriptions",
    fn = function(args)
        print("Available Commands:")
        for name, cmd in pairs(commands) do
            print("  " .. name .. " - " .. cmd.desc)
        end
    end
}

return commands
