local Commands = {}

function Commands.Hello(Context)
    Context.Message:reply("Hello there!")
end

function Commands.Say(Context)
    Context.Message:reply(table.concat(Context.Args, " "))
end

return Commands
