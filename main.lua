---
-- main.lua


package.path = package.path .. ";lib/?/init.lua;lib/?.lua;src/?.lua"


local lovetoys = require "lovetoys.lovetoys"
local Signal = require "hump.signal"


lovetoys.initialize({
    globals = true,
    debug = true
})

require "prepare_components"


local World = require "game_data.world.world"
local Game = require "systems.game_logic.game_system"
local UISystem = require "systems.ui.ui_system"
local View = require "systems.view.view_system"


local engine = {}


function love.load()
    engine = Engine()

    local signal = Signal.new()
    local world = World()

    local ui = UISystem({signal = signal, engine = engine})
    local view = View({signal = signal, world = world})
    local game = Game({signal = signal, engine = engine, world = world})

    engine:addSystem(ui, "update")
    engine:addSystem(ui, "draw")
    engine:addSystem(game, "update")
    engine:addSystem(view, "update")
    engine:addSystem(view, "draw")
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
