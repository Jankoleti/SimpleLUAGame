local input = require "input"
local g_entities = require "g_entities"
local g_game = require "g_game"


function Interface()

--MY BRANI IS JELLYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

if input.InputData.GetInput("m1pressed") then
for key, value in pairs(g_entities.UIELEMENTS) do
if IsCursorInEntity(value.posX, value.width, value.posY, value.height) then
value.func()
break
end
end
end
end


function IsCursorInEntity(posX, posXend, posY, posYend)
if input.InputData.mouseX > posX and
 input.InputData.mouseX < posXend + posX then
if input.InputData.mouseY > posY and
 input.InputData.mouseY < posYend + posY then
return true
end
end
return false
end







return
{
Interface = Interface
}
