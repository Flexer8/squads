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
	self.world = data.world

	-- набор объектов,с которыми может взаимодействовать система
	self.entitis = {}

	self.fsm = FSM({owner = self})

	self.fsm:add_state(MainView())
	self.fsm:add_state(EmptyView())
	self.fsm:add_state(GlobalState({
		signal = self.signal,
		owner = self
	}))

	self.fsm:set_global_state(self.fsm:get_state("GlobalState"))

	-- размер тайла
	self.tile_size = 32
end

function View:update(dt)
	self.entitis = {}

	for _, entity in ipairs(self.targets) do
		if entity:has("Image") then
			table.insert(self.entitis, entity)
		end
	end
end

function View:draw()
	if self.fsm:get_current_state() then
        self.fsm:get_current_state():draw(self)
    end
end

function View:requires()
	return {"Image"}
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

---
-- Получение доступа к объекту с игровым миром
--
-- @return[type=table] объект World
function View:get_world()
	return self.world
end

---
-- Получить набор объектов, с которыми может взаимодействовать система
--
-- @return[type=table]
function View:get_targets()
	return self.entitis
end

---
-- Получить размер тайла
--
-- @return[type=integer] Размер тайла
function View:get_tile_size()
	return self.tile_size
end

return View
