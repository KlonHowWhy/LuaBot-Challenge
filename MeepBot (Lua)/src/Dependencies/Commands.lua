local Commands = {}
local genRandom, HeheVariable

function NewRandomSeed() -- #TrueRandomizer
    local param1 = math.random(os.time())
    local param2 = math.random(os.time())

    local one = math.random(1, param1)
    local two = math.random(1, param2)

    math.randomseed(one, two)

    genRandom = math.random(1, 18)
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
                "** *...?*__\n> *Have we met before...? I don't think so-...* Well I'm **MeepBot** who will be your attendant for today.\n> \n" ..
                "> *Nice to meet you, **%s**-san!*",
                Context.Message.author.name)
        end

        if HeheVariable % 10 == 4 then
            Context.Message:reply("***Nyo.***")
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("**(  ¯^¯)**")
        else
            Context.Message:reply(string.format(
                "> **__Konnichiwa, %s",
                Context.Message.author.mentionString) .. Response)
        end

    elseif string.gsub(param, "%s+", ""):lower() == "en" then
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
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("***I refuse.***")
        else
            Context.Message:reply(string.format(
                "> **__Good day, %s",
                Context.Message.author.mentionString) .. Response)
        end

    elseif string.gsub(param, "%s+", ""):lower() == "jp" then
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
        elseif HeheVariable % 10 == 6 then
            Context.Message:reply("*丁寧に**お断りします。***")
        else
            Context.Message:reply(string.format(
                "> **__こんにちは、%s",
                Context.Message.author.mentionString) .. Response)
        end
    else
        Context.Message:reply(string.format(
            "I'm sorry, I don't know that language yet. But hello there, Mr. %s...\n\nOr perhaps... Mr/s. **%s**?",
            Context.Message.author.mentionString, Context.Message.author.name))
    end

    NewRandomSeed()
end

function Commands.Say(Context) --m/say with Regex to spite Ariri; done, the new OG
    local Message = string.gsub(Context.Message.content:sub(6), "%s*", "", 1)

    if string.sub(Message, -2) == ".a" then
        Context.Message:reply(string.gsub(Message, "%.a", ""))
        Context.Message:delete()
    else
        Context.Message:reply(string.format(
            "> **%s** says: \"" .. Message .. "\"",
            Context.Message.author.name))
    end
end

function Commands.Uwu(Context)
    local mainText = Context.Message.content:lower():sub(7)
    local output = mainText

    --[[ Updated rules:
        b-: bw-
        f- : fw-
        m-: mw- with exception of -me and "muu" for "moo"
        n-: ny-
        th-: the same, but doo(thoo) and "the -> de"
        is: ish
        -ight: -ite
        l- & r-: w-
        -ck: -cc
        ]]

    -- "close, forth, etc." -> "clwose, fwowth"
    output = string.gsub(output, "[rlv]", "w")

    -- "fluid, pregnant, etc." -> "fwuid, pwegnyant, etc."
    output = string.gsub(output, "([bdfgmpq])([aiueo])", "%1w%2")

    -- "then, this, etc." -> "dwen, dis, etc."
    output = string.gsub(output, "([cn])(aiueo)", "%1y%2")

    --"-ing " -> "-in " except if its only 4 char (1 + 3-ing )
    output = string.gsub(output, "(%S+%S)ing(%A)", "%1in'%2")

    --"-y " -> "-i "
    output = string.gsub(output, "(%S+)y(%A)", "%1i%2")

    -- "wh" -> "w"
    output = string.gsub(output, "wh", "w")

    -- "is" -> "ish"
    output = string.gsub(output, "is", "ish")

    -- "ight" -> "ite"
    output = string.gsub(output, "ight", "ite")

    -- "the" -> "de"
    output = string.gsub(output, "(%A?)the(%A)", "%1de%2")

    -- "ck" -> "cc"
    output = string.gsub(output, "ck", "cc")

    Context.Message:reply(string.format(
                            "> **%s** *cutely* says: \"" .. output .. " UwU\"",
                            Context.Message.author.name))
end

function Commands.Coinflip(Context) --m/coinflip; emojiiiiiiiiiiiiiiiiiiiiiiiiiiii
    local Command = "**`m/coinflip [your bet(heads or tails), optional]`**"
    local Flip = math.random(1, 10)
    local Bet = Context.Message.content:lower():sub(12)
    local ResultMessage = ""

    if HeheVariable == 13 then
        ResultMessage = string.format("> But wow, somehow the coin stands perfectly up and you managed to get the only draw outcome out of this game-\n> \n" ..
            "> Sasuga desu ne, **%s**-sama!",
            Context.Message.author.name) --needs emoji
    else
        if Flip % 2 == 0 then
            CoinState = "heads"
        else
            CoinState = "tails"
        end
        ResultMessage = "Your coin flip result is **" .. CoinState:gsub("^%l", string.upper) .. "**."
    end

    if HeheVariable == 243 then
        Context.Message:reply("> ***Go flip a coin yourself lmao***\n"..
            "> *Here's the link:* __https://bit.ly/3psvBMP__")
    elseif HeheVariable == 444 then
        Context.Message:reply("> ***Go flip a coin yourself lmao***\n"..
            "> *Here's the link:* __https://bit.ly/3wfO9nl__")
    else
        if Bet == "" then
            Context.Message:reply(string.format(
                "> **%s**-sama, " .. ResultMessage:gsub("^%l", string.lower),
                Context.Message.author.name)) --needs emoji
            Context.Message:addReaction("👍")
        elseif Bet == CoinState then
            Context.Message:reply(string.format(
                "> Congratulations, **%s**-sama! You won the coin flip~! :D :confetti_ball: :tada:\n> " .. ResultMessage:gsub("[.]", "!"),
                Context.Message.author.name))
        else
            if Bet == "heads" or Bet == "tails" then
                Context.Message:reply(string.format(
                    "> I'm sorry, **%s**-sama... The luck isn't on your side this time.\n> " .. ResultMessage,
                    Context.Message.author.name)) --needs emoji
            else
                Context.Message:reply(string.format(
                    "> I'm sorry master, but please format your command following this formula ^^\":\n> %s",
                    Command))
            end
        end
    end

    NewRandomSeed()
end

function Commands.Roll(Context) --m/roll; done
    local Command = "**`m/roll d[number to roll] [your bet, optional]`**"
    local Misc = Context.Message.content:sub(7)
    local _, _, Dice = string.find(Misc, "d(%d+)")
    local _, _, Gamble, Pin = string.find(Misc, "d(%d+)%s+(%d+)")
    local Sides, Roll, Bet, BetAnnounce, Disappointment, Reaction, Judgement

    if Dice == nil then
        if Pin == nil then
            Context.Message:reply(string.format(
                "> I'm sorry master, but please format your command following this formula ^^\":\n> %s",
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
        Bet = tonumber(Pin)
    end

    function BetResult()
        if Bet == Roll then
            if Bet == Sides then
                BetAnnounce = string.format(
                    "> **:trophy: |** Congratulations, **%s**-sama! Not only you got a jackpot, you also won the bet~! :D :confetti_ball: :tada:\n",
                    Context.Message.author.name)
            else
                BetAnnounce = string.format(
                    "> **<:void:1009958825434030201> |** Congratulations, **%s**-sama! You won the bet~! :D :trophy:\n",
                    Context.Message.author.name)
            end
        else
            if Bet == Sides then
                if Sides == 1 then
                    BetAnnounce = Context.Message:reply(string.format("> **<:void:1009958825434030201> |** *Are you that desparate for a win, **%s**-sama? :disappointment:*\n",
                    Context.Message.author.name))
                else
                    BetAnnounce = string.format(
                        "> **<:void:1009958825434030201> |** I'm sorry, **%s**-sama. Luck isn't on your side this time, even though you rolled a jackpot... :pensive:\n",
                        Context.Message.author.name)
                end

            elseif Bet > Sides then
                BetAnnounce = string.format(
                    "> **<:void:1009958825434030201> |** Do you really need to overkill your bet, **%s**-sama? :expressionless:\n",
                    Context.Message.author.name)
            else
                BetAnnounce = string.format(
                    "> **<:void:1009958825434030201> |** I'm sorry, **%s**-sama. Luck isn't on your side this time... :pensive:\n",
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
        elseif Sides == 1 then
            Judgement = "> **<:void:1009958825434030201> |** Nevertheless, you get the highest roll of **1**... Congratulations I guess, my master..."
        else
            Judgement = "> **<:void:1009958825434030201> |** Wow, Asian parents will be proud of you. :0\n> \n> :clap: :clap: :clap:"
        end
    end

    if HeheVariable == 500 then
        Context.Message:reply(string.format(
            "> **:skull: | *Oof...***\n> **<:void:1009958825434030201> |** Imagine being so bad that you rolled a **0** from a **%d**-sided Sides lmao\n> \n" ..
            "> **<:void:1009958825434030201> |** Git gud :upside_down:",
            Sides))
    elseif HeheVariable == 69 or HeheVariable == 420 then
        Context.Message:reply(string.format(
            "> **:trophy: |** You got a **jackpot** and rolled an astounding chance-defying roll of **69420**! :tada:\n" ..
            "> **<:void:1009958825434030201> |** *||Although you technically only got **%d** but that's the point of the jackpot www||*",
            tostring(Roll)))
    elseif Sides == 0 or Sides == 1 or Sides >= 9223372036854775806 then
        if Sides == 1 then
            Disappointment = Context.Message:reply(string.format(
                "> **:disappointed: |** *Are you that desparate for a win, **%s**-sama? :c*\n",
                Context.Message.author.name))
        else
            Disappointment = string.format( "> **:expressionless: |** ...\n",
                Context.Message.author.name)

            if genRandom % 2 == 0 then
                Context.Message:reply(string.format(Disappointment .. 
                    "> **<:void:1009958825434030201> |** Do you really think I'll allow that *atrocious* number*, **%s*%s\n",
                    Context.Message.author.name, "*-sama?*"))
            else
                Context.Message:reply(string.format(Disappointment ..
                    "> **<:void:1009958825434030201> |** I know what you're trying to do... \n" ..
                        "<:void:1009958825434030201> <:void:1009958825434030201> <:void:1009958825434030201> <:void:1009958825434030201> *||And I won't allow it, **%s**-sama. :)||*",
                        Context.Message.author.name))
            end
        end
    else
        if Bet == nil then
            Judge()
        else
            BetResult()
        end

        if Bet ~= nil then
            Context.Message:reply(string.format(
                "> **:game_die: |** You rolled a **%d**!\n" .. BetAnnounce,
                tostring(Roll)))
        else
            if Sides == 1 then
                Context.Message:reply(Disappointment .. Judgement)
            else
                Context.Message:reply(string.format(
                    "> **:game_die: |** You rolled a **%d**!\n" .. Judgement,
                    tostring(Roll)))
            end
        end
    end

    NewRandomSeed()
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
    else
        if genRandom % 3 == 1 then
            Context.Message:reply(string.format("> **:thinking: |** I think I'll choose **%s**, **%s**-sama.",
                Choice, Context.Message.author.name))
        elseif genRandom % 3 == 2 then
            Context.Message:reply(string.format("> **:thinking: |** 100%% for **%s**, **%s**-sama!",
            Choice, Context.Message.author.name))
        else
            Context.Message:reply(string.format("> **:thinking: |** Of course I'll choose **%s**, **%s**-sama www.",
            Choice, Context.Message.author.name))
        end
    end

    NewRandomSeed()
end

function Commands.Afk(Context) --m/afk; wip [logic written don't know how to code this]
    local command = Context.Message.content:sub(3)

    if string.gsub(command, "%s+", "") == "afk" then
        --[[
            if mention(command_sender) then reply(afk_message) to {message_sender};
            when {command_sender} send(message) then end(afk_command);
          ]]
    end
end

function Commands.Rps(Context) --m/rps (rock, paper, scissors); done for the basic logic. Aesthetics left.
    local Choice = string.gsub(Context.Message.content:sub(6), "%s*", "")
    local Win = "Congratulations! You win this round, my master! :D"
    local Draw = "It seems like we ended up in a draw, master :)"
    local Lose = "I'm sorry, but you lost this round..."
    local botChoice, WinMes, DrawMes, LoseMes
--m/rps scissors
    if genRandom % 3 == 1 then
        botChoice = "rock"
    elseif genRandom % 3 == 2 then
        botChoice = "scissors"
    elseif genRandom % 3 == 0 then
        botChoice = "paper"
    elseif HeheVariable % 10 == 7 then
        botChoice = "pistol"
    else
        botChoice = ""
    end

    if HeheVariable % 4 == 1 then
        WinMes = "You just got lucky, my master..."
        DrawMes = "Let's do another round, shall we? :3"
        LoseMes = "Better luck next time~ ^^"
    elseif HeheVariable % 4 == 2 then
        WinMes = "I'll have my revenge next time..."
        DrawMes = "Draw? :0"
        LoseMes = "You suck hahaha... Just kidding ;3"
    elseif HeheVariable % 4 == 3 then
        WinMes = "I applaud you :clap: :clap: :clap:"
        DrawMes = "Again! I don't acknowledge any result besides Win or Lose!!!"
        LoseMes = "Just give up, you can't defeat me >:D"
    else
        WinMes = "Wanna try another round? This time I won't lose :)"
        DrawMes = "We have the same braincell www. As expected from my master..."
        LoseMes = "... ;-;"
    end

    local matchSum = "\nYou threw a " .. Choice .. " against my " .. botChoice .. ". "

    if botChoice == "pistol" then
        Context.Message:reply(Lose .. matchSum .. "Nothing can beat a pistol, you know? :sunglasses:")
    elseif botChoice == "" then
        Context.Message:reply("?")
    elseif Choice:lower() == "scissors" then
        if botChoice == "paper" then
            Context.Message:reply(Win .. matchSum .. WinMes)
        elseif botChoice == "rock" then
            Context.Message:reply(Lose .. matchSum .. LoseMes)
        else
            Context.Message:reply(Draw .. matchSum .. DrawMes)
        end
    elseif Choice:lower() == "paper" then
        if botChoice == "rock" then
            Context.Message:reply(Win .. matchSum .. WinMes)
        elseif botChoice == "scissors" then
            Context.Message:reply(Lose .. matchSum .. LoseMes)
        else
            Context.Message:reply(Draw .. matchSum .. DrawMes)
        end
    elseif Choice:lower() == "rock" then
        if botChoice == "scissors" then
            Context.Message:reply(Win .. matchSum .. WinMes)
        elseif botChoice == "paper" then
            Context.Message:reply(Lose .. matchSum .. LoseMes)
        else
            Context.Message:reply(Draw .. matchSum .. DrawMes)
        end
    else
        Context.Message:reply("What the fuck?")
    end

    NewRandomSeed()
end

function Commands.Quote(Context) --Quote bot with m/quote [+, -, None]
end

return Commands
