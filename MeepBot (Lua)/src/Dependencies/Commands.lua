local Commands = {}
local genRandom, HeheVariable

function NewRandomSeed() -- #TrueRandomizer
    local param1 = math.random(os.time())
    math.randomseed(param1)
    local param2 = math.random(os.time())
    math.randomseed(param2)
    print("Log: " .. math.random() .. " " .. math.random() .. " " .. math.random())

    math.randomseed(param1, param2)

    genRandom = math.random(1, 15)
    HeheVariable = math.random(1, 500)
end

NewRandomSeed()

----------------------------------------------COMMANDS----------------------------------------------

function Commands.Hello(Context) --m/hello with its iterations; done
    local param = Context.Message.content:sub(8)

    if string.gsub(param, "%s+", "") == "" then
        if genRandom % 3 == 1 then
            Response = string.format(
                ".__**\n> I'm **MeepBot**, and I shall humbly call you by **%s**-sama as I'm your servant for today...\n> \n" ..
                "> *Yoroshiku onegaishimasu.*",
                Context.Message.author.name)
        elseif genRandom % 3 == 2 then
            Response = string.format(
                "~!__**\n> **MeepBot** will now be a maid for you, **%s**-sama! Looking forward for today~ :D\n> \n" ..
                "> *Let's enjoy this day to our fullest, okay~? :3*",
                Context.Message.author.name)
        else
            Response = string.format(
                "***...?*__\n> *Have we met before...? I don't think so-...* Well I'm **MeepBot** who will be your attendant for today.\n> \n" ..
                "> *Nice to meet you, **%s**-san!*",
                Context.Message.author.name)
        end

        if HeheVariable % 10 == 4 then
            Context.Message:reply("***Nyo.***")
            NewRandomSeed()
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("**(  ¯^¯)**")
            NewRandomSeed()
        else
            Context.Message:reply(string.format(
                "> **__Konnichiwa, %s",
                Context.Message.author.mentionString) .. Response)
            NewRandomSeed()
        end

    elseif string.gsub(param, "%s+", "") == "en" then
        if genRandom % 3 == 1 then
            Response = string.format(
                ".__**\n> Welcome back to our proudest **MeepBot** service, private for you the entire day.\n> \n" ..
                "> *Unit `M-" .. math.random(100000, 999999) .. "` is now ready to serve you, Agent **%s***.",
                Context.Message.author.name)
        elseif genRandom % 3 == 2 then
            Response = string.format(
                ".__**\n> The universe hests, as this **MeepBot** hast been bestowed honour to be thine maide 'til the sun dusks.\n> \n" ..
                "> *Fret not, as I will devote me self for you, **%s** the Hero...*",
                Context.Message.author.name)
        else
            Response = "...__**\n> I heed to thine call. And I, **MeepBot** shall anon act as thy servaunt f'r the present day.\n> \n" ..
                string.format(
                "> *Prithee taketh great care of me frail body, O' **%s** the Chosen One...*",
                Context.Message.author.name)
        end

        if HeheVariable % 10 == 4 then
            Context.Message:reply("***No.***")
            NewRandomSeed()
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("***I refuse.***")
            NewRandomSeed()
        else
            Context.Message:reply(string.format(
                "> **__Good day, %s",
                Context.Message.author.mentionString) .. Response)
            NewRandomSeed()
        end

    elseif string.gsub(param, "%s+", "") == "jp" then
        if genRandom % 3 == 1 then
            Response = string.format(
                "。__**\n> ようこそいらっしゃいませ、ご主人様。当意即妙「**MeepBot**」は今日一日あなたのみ出勤です！\n> \n" ..
                "> *どうぞお楽しみください、**%s**様。*",
                Context.Message.author.name)
        elseif genRandom % 3 == 2 then
            Response = string.format(
                "！__**\n> 今日は何をしますか、**%s**ちゃま？めっちゃ楽しみですわ！\n> \n" ..
                "> *今日は満幅に楽しましょう！*",
                Context.Message.author.name)
        else
            Response = string.format(
                "。。。__**\n> 今日から深夜まであなたのお世話になって、「**MeepBot**」と申します。この間、融通無碍ですから好きにさせてもOKです。\n> \n" ..
                "> *ただ。。。優しくしてくださいね、**%s**様？*",
                Context.Message.author.name)
        end

        if HeheVariable % 10 == 4 then
            Context.Message:reply("***いやです。***")
            NewRandomSeed()
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("*丁寧に**お断りします。***")
            NewRandomSeed()
        else
            Context.Message:reply(string.format(
                "> **__こんにちは、%s",
                Context.Message.author.mentionString) .. Response)
            NewRandomSeed()
        end
    else
        Context.Message:reply(string.format(
            "I'm sorry, I don't know that language yet. But hello there, Mr. %s...\n\nOr perhaps... Mr/s. **%s**?",
            Context.Message.author.mentionString, Context.Message.author.name))
    end
end

function Commands.Say(Context) --m/say; done
    Context.Message:reply(string.format(
        "> **%s** says: \"" .. table.concat(Context.Args, " ") .. "\"",
        Context.Message.author.name))
end

function Commands.Coinflip(Context) --m/coinflip; done
    local Command = "**`m/coinflip [your bet(heads or tails), optional]`**"
    local Flip = math.random(1, 10)
    local Bet = Context.Message.content:lower():sub(12)
    local ResultMessage = ""

    if genRandom == 13 then
        ResultMessage = string.format("But wow, somehow the coin stands perfectly up and you managed to get the only draw outcome out of this game-\n" ..
            "> Sasuga desu ne, **%s**-sama!",
            Context.Message.author.name)
    else
        if Flip % 2 == 0 then
            CoinState = "heads"
        else
            CoinState = "tails"
        end
        ResultMessage = "Your coin flip result is **" .. CoinState:gsub("^%l", string.upper) .. "**."
    end

    if HeheVariable == 13 then
        Context.Message:reply("> ***Go flip a coin yourself lmao***\n"..
            "> *Here's the link:* __https://bit.ly/3psvBMP__")
        NewRandomSeed()
    elseif HeheVariable == 444 then
        Context.Message:reply("> ***Go flip a coin yourself lmao***\n"..
            "> *Here's the link:* __https://bit.ly/3wfO9nl__")
        NewRandomSeed()
    else
        if Bet == "" then
            Context.Message:reply(string.format(
                "> **%s**-sama, " .. ResultMessage:gsub("^%l", string.lower),
                Context.Message.author.name))
            NewRandomSeed()
        elseif Bet == CoinState then
            Context.Message:reply(string.format(
                "> Congratulations, **%s**-sama! You won the coin flip~! :D :confetti_ball: :tada:\n> " .. ResultMessage:gsub("[.]", "!"),
                Context.Message.author.name))
            NewRandomSeed()
        else
            if Bet == "heads" or Bet == "tails" then
                Context.Message:reply(string.format(
                    "> I'm sorry, **%s**-sama... The luck isn't on your side this time.\n> " .. ResultMessage,
                    Context.Message.author.name))
                NewRandomSeed()
            else
                Context.Message:reply(string.format(
                    "> I'm sorry master, but please format your command following this ^^\":\n> %s",
                    Command))
                NewRandomSeed()
            end
        end
    end
end

function Commands.Roll(Context) --m/roll; done
    local Command = "**`m/roll d[number to roll] [your bet, optional]`**"
    local Misc = Context.Message.content:sub(7)
    local _, _, Dice = string.find(Misc, "d(%d+)")
    local _, _, Gamble, Pin = string.find(Misc, "d(%d+)%s+(%d+)")
    local Sides, Roll, BetAnnounce
    local Judgement = ""

    if Dice == nil then
        if Pin == nil then
            Context.Message:reply(string.format(
                "> I'm sorry master, but please format your command following this ^^\":\n> %s",
                Command))
            return
        else
            Sides = tonumber(Gamble)
            Bet = tonumber(Pin)
            Roll = math.random(1, Sides)
        end
    else
        Sides = tonumber(Dice)
        Roll = math.random(1, Sides)
    end

    function BetResult()
        if Bet == Roll then
            if Bet == Sides then
                BetAnnounce = string.format(
                    "> **:game_die: |** Congratulations, **%s**-sama! Not only you got a jackpot, you also won the bet~! :D :confetti_ball: :tada:\n",
                    Context.Message.author.name)
            else
                BetAnnounce = string.format(
                    "> **:game_die: |** Congratulations, **%s**-sama! You won the bet~! :D :tada:\n",
                    Context.Message.author.name)
            end
        else
            if Bet == Sides then
                BetAnnounce = string.format(
                    "> **:game_die: |** I'm sorry, **%s**-sama. Luck isn't on your side this time, even though you rolled a jackpot...\n",
                    Context.Message.author.name)
            else
                BetAnnounce = string.format(
                    "> **:game_die: |** I'm sorry, **%s**-sama. Luck isn't on your side this time...\n",
                    Context.Message.author.name)
            end
        end
    end

    function Judge()
        if Roll <= Sides / 8 then
            Judgement = "> **<:void:1009958825434030201> |** Wow, that's an abysmally low roll... Better luck next time. :no_mouth:"
        elseif Sides / 8 <= Roll and Roll <= Sides / 4 then
            Judgement = "> **<:void:1009958825434030201> |** You evaded the worst possible outcome, but still not enough. :smiling_face_with_tear:"
        elseif Sides / 4 <= Roll and Roll <= Sides / 2 then
            Judgement = "> **<:void:1009958825434030201> |** A low roll, but still salvageable. :innocent:"
        elseif Sides / 2 <= Roll and Roll <= Sides / 4 * 3 then
            Judgement = "> **<:void:1009958825434030201> |** Pretty decent roll, I'll give you that. =v=)b"
        elseif Sides / 4 * 3 <= Roll and Roll < Sides then
            Judgement = "> **<:void:1009958825434030201> |** Now that's what I call a *good* roll. :sunglasses:"
        else
            Judgement = "> **<:void:1009958825434030201> |** Wow, Asian parents will be proud of you. :0\n> \n> :clap: :clap: :clap:"
        end
    end

    if HeheVariable == 500 then
        Context.Message:reply(string.format(
            "> **:skull: | *Oof...***\n> **<:void:1009958825434030201> |** Imagine being so bad that you rolled a **0** from a **%d**-sided Sides lmao\n" ..
            "> **<:void:1009958825434030201> |**\n> **<:void:1009958825434030201> |** Git gud :upside_down: :regional_indicator_l:",
            Sides))
        NewRandomSeed()
    elseif HeheVariable == 69 or HeheVariable == 420 then
        Context.Message:reply(string.format(
            "> **:trophy: |** You got a **jackpot** and rolled an astounding chance-defying roll of **69420**! :tada:\n" ..
            "> **<:void:1009958825434030201> |** *||Although you technically only got **%d** but that's the point of the jackpot www||*",
            Roll))
        NewRandomSeed()
    else    
        Judge()
        BetResult()

        if Pin ~= nil then
            Context.Message:reply(string.format(
                BetAnnounce .. "> **<:void:1009958825434030201> |** You rolled a **%d**!\n",
                Roll))
            NewRandomSeed()
        else
            Context.Message:reply(string.format(
                "> **:game_die: |** You rolled a **%d**!\n" .. Judgement,
                Roll))
            NewRandomSeed()
        end
    end
end

function Commands.Choose(Context) --m/choose; done
    local ChoicesString = string.gsub(string.gsub(Context.Message.content:sub(10), "%s*", "", 1), ";%s*", ";")
    local Choices = {}

    for Choice in ChoicesString:gmatch("[^;]+") do
        table.insert(Choices, Choice)
    end

    local Choice = Choices[math.random(#Choices)]

    if HeheVariable % 100 == 3 then
        Context.Message:reply(string.format("> ***Choose yourself lmao***"))
        NewRandomSeed()
    else
        if genRandom % 3 == 1 then
            Context.Message:reply(string.format("> **:thinking: |** I think I'll choose **%s**, **%s**-sama.",
                Choice, Context.Message.author.name))
            NewRandomSeed()
        elseif genRandom % 3 == 2 then
            Context.Message:reply(string.format("> **:thinking: |** 100%% for **%s**, **%s**-sama!",
            Choice, Context.Message.author.name))
            NewRandomSeed()
        else
            Context.Message:reply(string.format("> **:thinking: |** Of course I'll choose **%s**, **%s**-sama www.",
            Choice, Context.Message.author.name))
            NewRandomSeed()
        end
    end

end

return Commands
