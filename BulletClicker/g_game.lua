local TIC_SYS =
{
tic = 0,
tmpTic = 0,
tic1 = 0,
tic5 = 0,
tic10 = 0,
tic50 = 0
}

local PLAYER_STATS =
{
g_bullets = 0,
g_bulletsPerClick = 1,
g_bulletsPerTick = 0,
g_bulletsPer5Ticks = 0,
g_bulletsPer10Ticks = 0,
g_bulletsPer50Ticks = 0,
g_bulletsSoldPerTick = 0,
g_bulletsSoldPer5Ticks = 0,
g_bulletsSoldPer10Ticks = 0,
g_bulletsSoldPer50Ticks = 0,
g_cash = 0.0,
g_bulletsSoldPerClick = 1,
g_crafters = 0,
g_sellers = 0,
g_factories = 0,
g_distributers = 0,
g_currentCostCrafter = 0,
g_currentCostSeller = 0,
g_currentCostFactory = 0,
g_currentCostDistributer = 0
}

local GAME_DEFINITIONS =
{
g_cashperbullet = 0.1,
g_priceMultiplierC = 1.2,
g_priceMultiplierS = 1.3,
g_priceMultiplierF = 2,
g_priceMultiplierD = 2.2,
g_crafterBaseCost = 10,
g_sellerBaseCost = 20,
g_factoryBaseCost = 1000,
g_distributerBaseCost = 2000
}

function InitializeDefaultValues()
PLAYER_STATS.g_bullets = 0
PLAYER_STATS.g_bulletsPerClick = 1
PLAYER_STATS.g_bulletsPerTick = 0
PLAYER_STATS.g_bulletsPer5Ticks = 0
PLAYER_STATS.g_bulletsPer10Ticks = 0
PLAYER_STATS.g_bulletsPer50Ticks = 0
PLAYER_STATS.g_cash = 0.0
PLAYER_STATS.g_bulletsSoldPerClick = 1
PLAYER_STATS.g_crafters = 0
PLAYER_STATS.g_sellers = 0
PLAYER_STATS.g_factories = 0
PLAYER_STATS.g_distributers = 0
PLAYER_STATS.g_bulletsSoldPerTick = 0
PLAYER_STATS.g_bulletsSoldPer5Ticks = 0
PLAYER_STATS.g_bulletsSoldPer10Ticks = 0
PLAYER_STATS.g_bulletsSoldPer50Ticks = 0

PLAYER_STATS.g_currentCostCrafter = GAME_DEFINITIONS.g_crafterBaseCost
PLAYER_STATS.g_currentCostSeller = GAME_DEFINITIONS.g_sellerBaseCost
PLAYER_STATS.g_currentCostFactory = GAME_DEFINITIONS.g_factoryBaseCost
PLAYER_STATS.g_currentCostDistributer = GAME_DEFINITIONS.g_distributerBaseCost

end


function BuyCrafter()
if CompareTakeCash(PLAYER_STATS.g_currentCostCrafter) then
PLAYER_STATS.g_crafters = PLAYER_STATS.g_crafters + 1
PLAYER_STATS.g_currentCostCrafter = PLAYER_STATS.g_currentCostCrafter * GAME_DEFINITIONS.g_priceMultiplierC
PLAYER_STATS.g_bulletsPerTick = PLAYER_STATS.g_bulletsPerTick + 1
end
end

function BuySeller()
if CompareTakeCash(PLAYER_STATS.g_currentCostSeller) then
PLAYER_STATS.g_sellers = PLAYER_STATS.g_sellers + 1
PLAYER_STATS.g_currentCostSeller = PLAYER_STATS.g_currentCostSeller * GAME_DEFINITIONS.g_priceMultiplierS
PLAYER_STATS.g_bulletsSoldPerTick = PLAYER_STATS.g_bulletsSoldPerTick + 1
end
end

function BuyFactory()
if CompareTakeCash(PLAYER_STATS.g_currentCostFactory) then
PLAYER_STATS.g_factories = PLAYER_STATS.g_factories + 1
PLAYER_STATS.g_currentCostFactory = PLAYER_STATS.g_currentCostFactory * GAME_DEFINITIONS.g_priceMultiplierF
PLAYER_STATS.g_bulletsPer10Ticks = PLAYER_STATS.g_bulletsPer10Ticks + 100
end
end

function BuyDistributer()
if CompareTakeCash(PLAYER_STATS.g_currentCostDistributer) then
PLAYER_STATS.g_distributers = PLAYER_STATS.g_distributers + 1
PLAYER_STATS.g_currentCostDistributer = PLAYER_STATS.g_currentCostDistributer * GAME_DEFINITIONS.g_priceMultiplierD
PLAYER_STATS.g_bulletsSoldPer10Ticks = PLAYER_STATS.g_bulletsSoldPer10Ticks + 100
end
end

function CALCULATE_ENGINE_TIC()
TIC_SYS.tmpTic = TIC_SYS.tmpTic + 1
if TIC_SYS.tmpTic > 100 then
TIC_SYS.tmpTic = 0
TIC_SYS.tic = TIC_SYS.tic + 1
TIC_SYS.tic1 = TIC_SYS.tic1 + 1
TIC_SYS.tic5 = TIC_SYS.tic5 + 1
TIC_SYS.tic10 = TIC_SYS.tic10 + 1
TIC_SYS.tic50 = TIC_SYS.tic50 + 1
end
end


function GET_BULLETS_TIC_ROUTINE()

if TIC_SYS.tic1 > 0 then
TIC_SYS.tic1 = 0
PLAYER_STATS.g_bullets =
PLAYER_STATS.g_bullets +
PLAYER_STATS.g_bulletsPerTick
SellBullets(PLAYER_STATS.g_bulletsSoldPerTick)
end

if TIC_SYS.tic5 > 4 then
TIC_SYS.tic5 = 0
PLAYER_STATS.g_bullets =
PLAYER_STATS.g_bullets +
PLAYER_STATS.g_bulletsPer5Ticks
SellBullets(PLAYER_STATS.g_bulletsSoldPer5Ticks)
end

if TIC_SYS.tic10 > 9 then
TIC_SYS.tic10 = 0
PLAYER_STATS.g_bullets =
PLAYER_STATS.g_bullets +
PLAYER_STATS.g_bulletsPer10Ticks
SellBullets(PLAYER_STATS.g_bulletsSoldPer10Ticks)
end

if TIC_SYS.tic50 > 49 then
TIC_SYS.tic50 = 0
PLAYER_STATS.g_bullets =
PLAYER_STATS.g_bullets +
PLAYER_STATS.g_bulletsPer50Ticks
SellBullets(PLAYER_STATS.g_bulletsSoldPer50Ticks)
end

end



function AddBulletsPerClick()
PLAYER_STATS.g_bullets =
PLAYER_STATS.g_bullets +
PLAYER_STATS.g_bulletsPerClick
end

function SellBulletsPerClick()

if PLAYER_STATS.g_bullets >= PLAYER_STATS.g_bulletsSoldPerClick then
PLAYER_STATS.g_bullets = PLAYER_STATS.g_bullets - PLAYER_STATS.g_bulletsSoldPerClick
PLAYER_STATS.g_cash = PLAYER_STATS.g_cash + (GAME_DEFINITIONS.g_cashperbullet * PLAYER_STATS.g_bulletsSoldPerClick)
elseif PLAYER_STATS.g_bullets < PLAYER_STATS.g_bulletsSoldPerClick and PLAYER_STATS.g_bullets > 0 then
PLAYER_STATS.g_cash = PLAYER_STATS.g_cash + (PLAYER_STATS.g_bullets * PLAYER_STATS.g_bulletsSoldPerClick)
PLAYER_STATS.g_bullets = 0
end
end

function SellBullets(x)
if PLAYER_STATS.g_bullets >= x and x > 0 then
PLAYER_STATS.g_bullets = PLAYER_STATS.g_bullets - x
PLAYER_STATS.g_cash = PLAYER_STATS.g_cash + (GAME_DEFINITIONS.g_cashperbullet * x)
elseif PLAYER_STATS.g_bullets < x then
PLAYER_STATS.g_cash = PLAYER_STATS.g_cash + (GAME_DEFINITIONS.g_cashperbullet * PLAYER_STATS.g_bullets)
PLAYER_STATS.g_bullets = 0
end
end


function CompareTakeCash(x)
if PLAYER_STATS.g_cash >= x then
PLAYER_STATS.g_cash = PLAYER_STATS.g_cash - x
return true
else
return false
end
end

return
{
AddBulletsPerClick = AddBulletsPerClick,
PLAYER_STATS = PLAYER_STATS,
CALCULATE_ENGINE_TIC = CALCULATE_ENGINE_TIC,
TIC_SYS = TIC_SYS,
INITIATE_COROUTINE = INITIATE_COROUTINE,
GET_BULLETS_TIC_ROUTINE = GET_BULLETS_TIC_ROUTINE,
GAME_DEFINITIONS = GAME_DEFINITIONS,
SellBulletsPerClick = SellBulletsPerClick,
BuyCrafter = BuyCrafter,
BuySeller = BuySeller,
BuyFactory = BuyFactory,
BuyDistributer = BuyDistributer,
InitializeDefaultValues = InitializeDefaultValues
}
