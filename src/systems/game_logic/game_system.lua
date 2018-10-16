---
-- game_system.lua
--
-- Система, содержащая логику игры


local class = require "middleclass"

local FSM = require "utils.fsm"

-- состояния
local StarterMenu = require "systems.game_logic.states.starter_menu_state"
local ExitGame = require "systems.game_logic.states.exit_game_state"
local MainGame = require "systems.game_logic.states.main_game_state"


local Game = class("Game", System)

function Game:initialize(data)
	System.initialize(self)

	self.signal = data.signal
    self.engine = data.engine

	self.fsm = FSM({owner = self})

	self.fsm:add_state(StarterMenu({signal = self.signal}))
	self.fsm:add_state(ExitGame({signal = self.signal}))
	self.fsm:add_state(MainGame({signal = self.signal}))

	-- установка начального состояния
	self.fsm:change_state(self.fsm:get_state("StarterMenu"))
end

function Game:update(dt)
	self.fsm:update(dt)
end

function Game:requires()
	return {}
end

function Game:onAddEntity(entity)
    -- body...
end

---
-- Получение доступа к Engine
--
-- @return[type=table] объект engine
function Game:get_engine()
    return self.engine
end

---
-- Получение доступа к FSM
--
-- @return[type=table] объект fsm
function Game:get_fsm()
    return self.fsm
end

return Game
