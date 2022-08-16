local Json = require("../Dependencies/json.lua")
local EventHandler = require("../Dependencies/EventHandler.lua")
local Commands = require("../Dependencies/Commands.lua")
local CommandHandler = require("../Dependencies/CommandHandler.lua")

local Command = require("../Classes/Command.lua")

local Runtime = {
    Data = {},
    DataFiles = {"Settings", "EventNames"}
}

function Runtime.LoadJsonFiles()
    for _, DataFileName in pairs(Runtime.DataFiles) do
        local DataFile = io.open(string.format("src/Data/%s.json", DataFileName))
        local Content = DataFile:read("*a")

        Runtime.Data[DataFileName] = Json.Decode(Content)
    
        DataFile:close()
    end
end

function Runtime.DoCommands()
    for Key, Function in pairs(Commands) do
        CommandHandler.addCommand(Command.new(Key, "This is a description", function(Message, ...)
            Function({
                CommandHandler = CommandHandler,
                Message = Message,
                Args = {...}
            })
        end))
    end
end

function Runtime.HandleEvents(Client)
    for Event, Handler in pairs(EventHandler) do
        local Name = Runtime.Data.EventNames[Event]
        if type(Handler) == "function" and Name then
            Client:on(Name, function(...)
                return Handler(Runtime, ...)
            end)
        end
    end
end

function Runtime.RunBot(Client)
    Client:run(string.format("Bot %s", Runtime.Data.Settings.Token))
end

function Runtime._getCommandHandler()
    return CommandHandler
end

return Runtime