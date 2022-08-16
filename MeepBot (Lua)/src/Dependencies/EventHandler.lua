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

--[[
    -- Regular commands without parameters
    if Content == "hello" then
        Message:reply(string.format("Konnichiwa, %s-sama!", Message.author.mentionString))
    end

    -- Iterations of the commands (commands with parameters)
    local Command, param = Content:match"(.-) (.+)"
    if Command == "hello" then
        if param == "jp" then
            Message:reply(string.format(
                "こんにちは、 %sー様!"
                , Message.author.mentionString))
        elseif param == "en" then
            Message:reply(string.format(
                "Hello my master, %s-sama!"
                , Message.author.mentionString))
        else
            Message:reply(string.format(
                "I'm sorry, I don't know that language...\nBut hello my master, %s-sama!",
                Message.author.mentionString))
        end]]