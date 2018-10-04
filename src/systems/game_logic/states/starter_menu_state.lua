---
-- starter_menu_state.lua
--
-- Состояние стартового меню


local class = require "middleclass"


local StarterMenu = class("StarterMenu")

function StarterMenu:initialize(data)
	self.name = StarterMenu.name
	self.signal = data.signal
end

function StarterMenu:enter(owner)
	-- body...
end

function StarterMenu:execute(dt, owner)
	-- body...
end

function StarterMenu:exit(owner)
	-- body...
end

return StarterMenu
