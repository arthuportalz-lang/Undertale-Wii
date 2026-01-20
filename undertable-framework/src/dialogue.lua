local dialogue = {}

local input = require('src.input')
dialogue.dialogues = {
    "Hello World",
    "STAR PLATINUM",
    "ZA WARUDO"
}

dialogue.textFinal = ""
dialogue.currentChar = 1
dialogue.i = 1
dialogue.enable = true
dialogue.back = false
dialogue.finished = false
dialogue.count = #dialogue.dialogues 

function dialogue.update(dt)
    if dialogue.finished == false then
        if dialogue.currentChar <= #dialogue.dialogues[dialogue.i] then
            dialogue.textFinal = dialogue.textFinal .. dialogue.dialogues[dialogue.i]:sub(dialogue.currentChar, dialogue.currentChar)
            dialogue.currentChar = dialogue.currentChar + 1
        end

        if dialogue.currentChar > #dialogue.dialogues[dialogue.i] then
            dialogue.finished = true
        end   
    end

    if dialogue.finished == true and input.Z then
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

function dialogue.draw()
    love.graphics.print(dialogue.textFinal,0 , 0)
end

return dialogue