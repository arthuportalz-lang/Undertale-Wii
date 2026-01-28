local dialogue = {}

local input = require('src.input')
dialogue.dialogues = {
    "STAR PLATINUM",
    "ZA WARUDO"
}

local locall = false

dialogue.textFinal = ""
dialogue.currentChar = 1
dialogue.i = 1
dialogue.enable = true
dialogue.back = false
dialogue.finished = false
dialogue.count = #dialogue.dialogues
dialogue.auto = false
dialogue.controlFinish = false
dialogue.timer = 0
dialogue.timerMax = 1
dialogue.timerOriginal = 1
local sfx

function dialogue.load()
    sfx = love.audio.newSource("assets/sounds/sfx/SND_TXT2.wav", "static")
end

function dialogue.update(dt)
    if dialogue.enable then
        dialogue.timer = dialogue.timer + 1
        if dialogue.dialogues[dialogue.i] == nil then
            dialogue.enable = false
        end

        dialogue.count = #dialogue.dialogues

        if dialogue.dialogues[dialogue.i]:sub(dialogue.currentChar-1, dialogue.currentChar-1) == "," or dialogue.dialogues[dialogue.i]:sub(dialogue.currentChar-1, dialogue.currentChar-1) == ":" then
            dialogue.timerMax = 15
        end

        if dialogue.timer > dialogue.timerMax then
            if not dialogue.finished then
                if dialogue.currentChar <= #dialogue.dialogues[dialogue.i] then
                    dialogue.textFinal = dialogue.textFinal .. dialogue.dialogues[dialogue.i]:sub(dialogue.currentChar, dialogue.currentChar)
                    dialogue.currentChar = dialogue.currentChar + 1

                    if dialogue.dialogues[dialogue.i]:sub(dialogue.currentChar, dialogue.currentChar) ~= " " then
                        local clone = sfx:clone()
                        clone:play()
                    end
                end

                if dialogue.currentChar > #dialogue.dialogues[dialogue.i] then
                    if not dialogue.controlFinish then
                        dialogue.finished = true
                    end
                end
            end

            dialogue.timer = 0
            dialogue.timerMax = dialogue.timerOriginal
        end
        
        if dialogue.finished then
            if dialogue.auto or input.Z then
                dialogue.currentChar = 1
                dialogue.textFinal = ""
                dialogue.finished = false
                dialogue.i = dialogue.i + 1

                if dialogue.i > dialogue.count then
                    dialogue.enable = false
                    dialogue.i = 1
                end
            end
        end
    else
        dialogue.textFinal = ""
        dialogue.currentChar = 1
        dialogue.i = 1
        dialogue.back = false
        dialogue.finished = false
        dialogue.count = #dialogue.dialogues
        dialogue.auto = false
        dialogue.controlFinish = false
    end
end

return dialogue