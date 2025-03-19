local g_game = require "g_game"
local g_entities = require "g_entities"
local g_data = require "g_data"

local font = love.graphics.getFont()
local text = love.graphics.newText(font)
local texttic = love.graphics.newText(font)
local textmoney = love.graphics.newText(font)
local debugText = love.graphics.newText(font)
local crafterStats = love.graphics.newText(font)
local sellerStats = love.graphics.newText(font)
local factoryStats = love.graphics.newText(font)
local distributerStats = love.graphics.newText(font)



function DrawTextureTiled(startX,startY,columns,rows,image)
textureSizeX = image:getPixelWidth()
textureSizeY = image:getPixelHeight()
drawX = startX
drawY = startY
for i = 0, rows do
	for z = 0, columns do
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(image, drawX, drawY)
	drawX = drawX + textureSizeX
	end
drawX = startX
drawY = drawY + textureSizeY
end
end















function Render()


texttic:set("Tic: " .. g_game.TIC_SYS.tic
.. " tmpTic: " .. g_game.TIC_SYS.tmpTic)
text:set("Bullets: " ..
g_game.PLAYER_STATS.g_bullets)
textmoney:set("Money: $" .. g_game.PLAYER_STATS.g_cash)
debugText:set(g_entities.DEBUG_TEXT)
crafterStats:set("Crafters: " .. g_game.PLAYER_STATS.g_crafters .. " B/T: " .. g_game.PLAYER_STATS.g_bulletsPerTick .. "\nCost: $" .. g_game.PLAYER_STATS.g_currentCostCrafter)
sellerStats:set("Sellers: " .. g_game.PLAYER_STATS.g_sellers .. " S/T: " .. g_game.PLAYER_STATS.g_bulletsSoldPerTick .. "\nCost: $" .. g_game.PLAYER_STATS.g_currentCostSeller)
factoryStats:set("Factories: " .. g_game.PLAYER_STATS.g_factories .. " B/10T's: " .. g_game.PLAYER_STATS.g_bulletsPer10Ticks .. "\nCost: $" .. g_game.PLAYER_STATS.g_currentCostFactory)
distributerStats:set("Distributers: " .. g_game.PLAYER_STATS.g_distributers .. " S/10T's: " .. g_game.PLAYER_STATS.g_bulletsSoldPer10Ticks .. "\nCost: $" .. g_game.PLAYER_STATS.g_currentCostDistributer)

love.graphics.clear(0,0,0)

DrawTextureTiled(0,0,30,20,g_data.TEXTURES.backgroundtile)

love.graphics.setColor(25, 25, 25, 50)
love.graphics.draw(texttic, 5, 5)
love.graphics.draw(debugText, 300, 5)
love.graphics.setColor(255, 0, 0, 255)
love.graphics.draw(text, 5, 20)
love.graphics.draw(textmoney, 5, 35)

love.graphics.draw(crafterStats, g_entities.BuyCrafterIcon.posX + 110, g_entities.BuyCrafterIcon.posY)
love.graphics.draw(sellerStats, g_entities.BuySellerIcon.posX + 110, g_entities.BuySellerIcon.posY)
love.graphics.draw(factoryStats, g_entities.BuyFactoryIcon.posX + 110, g_entities.BuyFactoryIcon.posY)
love.graphics.draw(distributerStats, g_entities.BuyDistributerIcon.posX + 110, g_entities.BuyDistributerIcon.posY)

DrawUIButtons()





end

function DrawUIButtons()
love.graphics.setColor(255, 255, 255, 255)
for key, value in pairs(g_entities.UIELEMENTS) do
love.graphics.draw(value.texture, value.posX, value.posY)
end
end






return
{
Render = Render,
TEXTURES = TEXTURES
}
