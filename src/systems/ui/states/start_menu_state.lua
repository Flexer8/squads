---
-- start_menu_state.lua
--
-- Начальное меню


local class = require "middleclass"


local StartMenu = class("StartMenu")

function StartMenu:initialize(data)
	self.name = StartMenu.name
	self.signal = data.signal
	self.ui = data.ui

	-- данные об окне
	self.window_width, self.window_height = love.window.getMode()

	-- Размеры отельных кнопок
	self.button_widht = 300
	self.button_height = 32
end

function StartMenu:enter(owner)
	-- body...
end

function StartMenu:execute(dt, owner)
	self.ui.layout:reset(
		(self.window_width / 2) - (self.button_widht / 2),
		100
	)
	self.ui.layout:padding(10, 10)

	self.ui:Label("SQUADS!", self.ui.layout:row(self.button_widht, self.button_height))

	if self.ui:Button("New Game", {id = 1}, self.ui.layout:row()).hit then
		self.signal:emit("NewGame")
	end

	if self.ui:Button("Exit Game", {id = 2}, self.ui.layout:row()).hit then
		self.signal:emit("ExitGame")
	end
end

function StartMenu:draw(owner)
	self.ui:draw()
end

function StartMenu:exit(owner)
	-- body...
end

return StartMenu
