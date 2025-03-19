local g_game = require "g_game"
local g_renderer = require "g_renderer"
local g_interface = require "g_interface"
local input = require "input"

local w_width = 800
local w_height = 600



function love.load()
love.window.setMode(w_width, w_height)
g_game.InitializeDefaultValues()
end


function love.update(dt)

g_game.CALCULATE_ENGINE_TIC()
g_game.GET_BULLETS_TIC_ROUTINE()
g_interface.Interface()
input.ResetInputEvent()
end


--DRAW THE SCREEN
function love.draw()
g_renderer.Render()
end



--GET MOUSE POS AND INPUT
function love.mousepressed(x, y, button)
input.InputData.mouseX = x
input.InputData.mouseY = y
if button == 1 then
input.InputData.input = "m1pressed"
elseif button == 2 then
input.InputData.input = "m2pressed"
end
end
