---
-- main.lua


package.path = package.path .. ";lib/?/init.lua;lib/?.lua;src/?.lua"


local lovetoys = require "lovetoys.lovetoys"
local Signal = require "hump.signal"

local Game = require "systems.game_logic.game_system"
local UISystem = require "systems.ui.ui_system"


lovetoys.initialize({
    globals = true,
    debug = true
})


local engine = {}


function love.load()
    engine = Engine()

    local signal = Signal.new()

    local ui = UISystem({signal = signal})
    local game = Game({signal = signal, engine = engine})

    engine:addSystem(ui, "update")
    engine:addSystem(ui, "draw")
    engine:addSystem(game, "update")
end

function love.update(dt)
    if dt < 1/60 then
        love.timer.sleep(1/60 - dt)
    end

    engine:update(dt)
end

function love.draw()
    engine:draw()
end
