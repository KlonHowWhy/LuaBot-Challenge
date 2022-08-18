local Events = {}

function Events.OnReady(_)
    print("\nI'm here! :D")
end

function Events.OnMessageSent(Runtime, Message)
    if Message.author.bot then
        return
    end

    Runtime._getCommandHandler().parse(Message, Runtime.Data.Settings.Prefix)
end

return Events
