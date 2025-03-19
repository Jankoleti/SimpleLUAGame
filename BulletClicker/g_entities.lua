local g_data = require "g_data"
local g_game = require "g_game"


DEBUG_TEXT = "defaultDebug"

UIElement = {texture = nil,
ent_type = "default",
posX = 0,
posY = 0,
width = 0,
height = 0,
func = nil
}

function UIElement:new(texture, ent_type, posX, posY, width, height, func)
o = {}
setmetatable(o, self)
self.__index = self
o.texture = texture
o.ent_type = ent_type
o.posX = posX
o.posY = posY
o.width = width
o.height = height
o.func = func
return o
end



GetBulletsButton =
{
	texture = g_data.TEXTURES.makebutton,
	ent_type = "button",
	posX = 20,
	posY = 300,
	width = g_data.TEXTURES.makebutton:getPixelWidth(),
	height = g_data.TEXTURES.makebutton:getPixelHeight(),
	func = g_game.AddBulletsPerClick
}

SellBulletsButton =
{
	texture = g_data.TEXTURES.sellbutton,
	ent_type = "button",
	posX = GetBulletsButton.posX,
	posY = GetBulletsButton.posY + 120,
	width = g_data.TEXTURES.sellbutton:getPixelWidth(),
	height = g_data.TEXTURES.sellbutton:getPixelHeight(),
	func = g_game.SellBulletsPerClick
}

BuyCrafterIcon =
{
	texture = g_data.TEXTURES.crafterbutton,
	ent_type = "button",
	posX = 500,
	posY = 100,
	width = g_data.TEXTURES.crafterbutton:getPixelWidth(),
	height = g_data.TEXTURES.crafterbutton:getPixelHeight(),
	func = g_game.BuyCrafter
}

BuySellerIcon =
{
	texture = g_data.TEXTURES.sellerbutton,
	ent_type = "button",
	posX = BuyCrafterIcon.posX,
	posY = BuyCrafterIcon.posY + 110,
	width = g_data.TEXTURES.sellerbutton:getPixelWidth(),
	height = g_data.TEXTURES.sellerbutton:getPixelHeight(),
	func = g_game.BuySeller
}

BuyFactoryIcon =
{
	texture = g_data.TEXTURES.factorybutton,
	ent_type = "button",
	posX = BuySellerIcon.posX,
	posY = BuySellerIcon.posY + 110,
	width = g_data.TEXTURES.factorybutton:getPixelWidth(),
	height = g_data.TEXTURES.factorybutton:getPixelHeight(),
	func = g_game.BuyFactory
}

BuyDistributerIcon =
{
	texture = g_data.TEXTURES.distributerbutton,
	ent_type = "button",
	posX = BuyFactoryIcon.posX,
	posY = BuyFactoryIcon.posY + 110,
	width = g_data.TEXTURES.distributerbutton:getPixelWidth(),
	height = g_data.TEXTURES.distributerbutton:getPixelHeight(),
	func = g_game.BuyDistributer
}

local UIELEMENTS =
{
Ent_GetBulletsButton = UIElement:new(GetBulletsButton.texture,
GetBulletsButton.ent_type,
GetBulletsButton.posX,
GetBulletsButton.posY,
GetBulletsButton.width,
GetBulletsButton.height,
GetBulletsButton.func),

Ent_SellBulletsButton = UIElement:new(SellBulletsButton.texture,
SellBulletsButton.ent_type,
SellBulletsButton.posX,
SellBulletsButton.posY,
SellBulletsButton.width,
SellBulletsButton.height,
SellBulletsButton.func),

Ent_BuyCrafterButton = UIElement:new(BuyCrafterIcon.texture,
BuyCrafterIcon.ent_type,
BuyCrafterIcon.posX,
BuyCrafterIcon.posY,
BuyCrafterIcon.width,
BuyCrafterIcon.height,
BuyCrafterIcon.func),

Ent_BuySellerButton = UIElement:new(BuySellerIcon.texture,
BuySellerIcon.ent_type,
BuySellerIcon.posX,
BuySellerIcon.posY,
BuySellerIcon.width,
BuySellerIcon.height,
BuySellerIcon.func),

Ent_BuyFactoryButton = UIElement:new(BuyFactoryIcon.texture,
BuyFactoryIcon.ent_type,
BuyFactoryIcon.posX,
BuyFactoryIcon.posY,
BuyFactoryIcon.width,
BuyFactoryIcon.height,
BuyFactoryIcon.func),

Ent_BuyDistributerButton = UIElement:new(BuyDistributerIcon.texture,
BuyDistributerIcon.ent_type,
BuyDistributerIcon.posX,
BuyDistributerIcon.posY,
BuyDistributerIcon.width,
BuyDistributerIcon.height,
BuyDistributerIcon.func),

}


return
{
GetBulletsButton = GetBulletsButton,
SellBulletsButton = SellBulletsButton,
BuyCrafterIcon = BuyCrafterIcon,
BuySellerIcon = BuySellerIcon,
BuyFactoryIcon = BuyFactoryIcon,
BuyDistributerIcon = BuyDistributerIcon,
UIELEMENTS = UIELEMENTS,
DEBUG_TEXT = DEBUG_TEXT
}
