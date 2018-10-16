---
-- main_view.lua
--
-- Состояние GUI с отображением основного интерфейса игры


local class = require "middleclass"


local MainView = class("MainView")

function MainView:initialize(data)
	self.name = MainView.name
end

function MainView:enter(owner)
	-- body...
end

function MainView:execute(dt, owner)
	-- body...
end

function MainView:draw()
	-- body...
end

function MainView:exit(owner)
	-- body...
end

return MainView
