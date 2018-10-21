---
-- main_view.lua
--
-- Состояние GUI с отображением основного интерфейса игры


local class = require "middleclass"
local sti = require "sti"


local MainView = class("MainView")

function MainView:initialize(data)
	self.name = MainView.name

	self.map = nil
end

function MainView:enter(owner)
	if not self.map then
		local world = owner:get_world()

		self.map = sti(world:map_to_draw())
	end
end

function MainView:execute(dt, owner)
	self.map:update(dt)
end

function MainView:draw()
	self.map:draw()
end

function MainView:exit(owner)
	-- body...
end

return MainView
