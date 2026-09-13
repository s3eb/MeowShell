local config = require("config")
local commands = require("commands")
local lock = require("lock")

-- محاولة تحميل مكتبة linenoise بحماية
local has_linenoise, linenoise = pcall(require, "linenoise")

local history_file = ".meow_history"

if has_linenoise then
    linenoise.historyload(history_file)
end

local function read_input(prompt)
    if has_linenoise then
        local str = linenoise.line(prompt)
        if str and str ~= "" then
            linenoise.historyadd(str)
            linenoise.historysave(history_file)
        end
        return str
    else
        io.write(prompt)
        return io.read()
    end
end

if not lock.auth() then
    os.exit()
end

while true do
    local input = read_input(config.shell_prompt .. "> ")

    if input then
        local cmd_name, args = input:match("^%s*(%S+)%s*(.*)$")

        local cmd_struct = commands[cmd_name]

        if cmd_struct and cmd_struct.fn then
            cmd_struct.fn(args)
        else
            if cmd_name and cmd_name ~= "" then
                local fullCMD = cmd_name
                if args and args ~= "" then
                    fullCMD = fullCMD .. " " .. args
                end

                os.execute(fullCMD)
            end
        end
    end
end
