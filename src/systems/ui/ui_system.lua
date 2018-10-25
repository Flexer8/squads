---
-- ui_system.lua
--
-- Система, обрабтывающая отображение и взаимодействие с интерфейсом


local class = require "middleclass"
local SUIT = require "suit"

local FSM = require "utils.fsm"

-- состояния системы
local GlobalState = require "systems.ui.states.global_state"
local StartMenu = require "systems.ui.states.start_menu_state"
local ExitMenu = require "systems.ui.states.exit_menu_state"
local MainGameMenu = require "systems.ui.states.main_game_state"


local UISystem = class("UISystem", System)

function UISystem:initialize(data)
	System.initialize(self)

	self.signal = data.signal
	self.ui = SUIT.new()
	self.engine = data.engine

	self.fsm = FSM({owner = self})

	self.fsm:add_state(StartMenu({signal = self.signal, ui = self.ui}))
	self.fsm:add_state(ExitMenu({signal = self.signal, ui = self.ui}))
	self.fsm:add_state(MainGameMenu({signal = self.signal, ui = self.ui}))
	self.fsm:add_state(GlobalState({
		signal = self.signal,
		owner = self
	}))

	self.fsm:set_global_state(self.fsm:get_state("GlobalState"))

	-- размер тайла
	self.tile_size = 32

	-- размеры активной части экрана
	self.screen_x = 20
	self.screen_y = 15
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

---
-- Получение доступа к Engine
--
-- @return[type=table] объект engine
function UISystem:get_engine()
    return self.engine
end

---
-- Получить размер тайла
--
-- @return[type=integer] Размер тайла
function UISystem:get_tile_size()
	return self.tile_size
end

---
-- Получить размер активной части экрана
--
-- @return[type=integer] Размер по Х и по У
function UISystem:get_resolution()
	return self.screen_x, self.screen_y
end

return UISystem
