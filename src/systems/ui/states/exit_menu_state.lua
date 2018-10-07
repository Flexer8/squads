---
-- exit_menu_state.lua
--
-- Начальное меню


local class = require "middleclass"


local ExitMenu = class("ExitMenu")

function ExitMenu:initialize(data)
	self.name = ExitMenu.name
	self.signal = data.signal
	self.ui = data.ui

	-- данные об окне
	self.window_width, self.window_height = love.window.getMode()

	-- Размеры отельных кнопок
	self.button_widht = 300
	self.button_height = 32
end

function ExitMenu:enter(owner)
	-- body...
end

function ExitMenu:execute(dt, owner)
	self.ui.layout:reset(
		(self.window_width / 2) - (self.button_widht / 2),
		100
	)
	self.ui.layout:padding(10, 10)

	self.ui:Label("ExitGame?", self.ui.layout:row(self.button_widht, self.button_height))

	if self.ui:Button("Return", {id = 1}, self.ui.layout:row()).hit then
		self.signal:emit("Return")
	end

	if self.ui:Button("Exit", {id = 2}, self.ui.layout:row()).hit then
		self.signal:emit("Exit")
	end
end

function ExitMenu:draw(owner)
	self.ui:draw()
end

function ExitMenu:exit(owner)
	-- body...
end

return ExitMenu
