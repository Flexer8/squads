---
-- view_system.lua
--
-- Система, отображающая игровой мир


local class = require "middleclass"

local FSM = require "utils.fsm"

-- состояния системы
local GlobalState = require "systems.view.states.global_state"
local MainView = require "systems.view.states.main_view"
local EmptyView = require "systems.view.states.empty_state"


local View = class("View", System)

function View:initialize(data)
	System.initialize(self)

	self.signal = data.signal

	self.fsm = FSM({owner = self})

	self.fsm:add_state(MainView())
	self.fsm:add_state(EmptyView())
	self.fsm:add_state(GlobalState({
		signal = self.signal,
		owner = self
	}))

	self.fsm:set_global_state(self.fsm:get_state("GlobalState"))
end

function View:update(dt)
	-- body...
end

function View:draw()
	if self.fsm:get_current_state() then
        self.fsm:get_current_state():draw(self)
    end
end

function View:requires()
	return {}
end

function View:onAddEntity(entity)
	-- body...
end

---
-- Получение доступа к FSM
--
-- @return[type=table] объект fsm
function View:get_fsm()
    return self.fsm
end

return View
