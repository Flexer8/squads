---
-- ui_system.lua
--
-- Система, обрабтывающая отображение и взаимодействие с интерфейсом


local class = require "middleclass"
local SUIT = require "suit"

local FSM = require "utils.fsm"

-- состояния системы
local GlobalState = require "systems.ui.states.global_state"
local SimpleMenu = require "systems.ui.states.simple_menu_state"


local UISystem = class("UISystem", System)

function UISystem:initialize(data)
	System.initialize(self)

	self.signal = data.signal
	self.ui = SUIT.new()

	self.fsm = FSM({owner = self})

	self.fsm:add_state(SimpleMenu({signal = self.signal}))
	self.fsm:add_state(GlobalState({
		signal = self.signal,
		owner = self
	}))

	self.fsm:set_global_state(self.fsm:get_state("GlobalState"))
end

function UISystem:update(dt)
	self.fsm:update(dt)
end

function UISystem:draw()
	if self.fsm:get_current_state() then
        self.fsm:get_current_state():draw(self)
    end
end

function UISystem:requires()
	return {}
end

function UISystem:onAddEntity(entity)
	-- body...
end

---
-- Получение модуля SUIT для рисования интерфейса
--
-- @return[type=table] модуль suit
function UISystem:get_ui()
	return self.ui
end

---
-- Получение доступа к FSM
--
-- @return[type=table] объект fsm
function UISystem:get_fsm()
    return self.fsm
end

return UISystem
