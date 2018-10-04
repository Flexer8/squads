---
-- simple_menu_state.lua
--
-- Простое меню


local class = require "middleclass"


local SimpleMenu = class("SimpleMenu")

function SimpleMenu:initialize(data)
	self.name = SimpleMenu.name
	self.signal = data.signal
end

function SimpleMenu:enter(owner)
	-- body...
end

function SimpleMenu:execute(dt, owner)
	-- body...
end

function SimpleMenu:draw(owner)
	-- body...
end

function SimpleMenu:exit(owner)
	-- body...
end

return SimpleMenu
