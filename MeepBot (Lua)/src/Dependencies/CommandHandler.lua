local CommandHandler = {Commands = {}}

function CommandHandler.addCommand(CommandObject)
    CommandHandler.Commands[CommandObject.Name:lower()] = CommandObject
end

function CommandHandler.parse(Message, PrefixYes)
    local Content = Message.content

    local Arguments = {}

    for Argument in Content:gmatch("%S+") do
        table.insert(Arguments, Argument)
    end

    local Prefix = Content:sub(1, #PrefixYes):lower() --Prefix part; i.e [m/]hello
    local Command = CommandHandler.Commands[Arguments[1]:sub(3):lower()] --Command part; i.e m/[hello]

    local CommandYes = Prefix == PrefixYes and Command ~= nil

    if not CommandYes then
        return false
    end

    table.remove(Arguments, 1)

    Command:run(Message, Arguments)
end

return CommandHandler
