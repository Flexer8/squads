---
-- main_game_state.lua
--
-- Отображение GUI для основного состояния игры


local class = require "middleclass"


local MainGameMenu = class("MainGameMenu")

function MainGameMenu:initialize(data)
	self.name = MainGameMenu.name
	self.signal = data.signal
	self.ui = data.ui

	-- данные об окне
	self.window_width, self.window_height = love.window.getMode()

	-- Размеры отельных кнопок
	self.button_widht = 64
	self.button_height = 32
end

function MainGameMenu:enter(owner)

end

function MainGameMenu:execute(dt, owner)
	self.ui.layout:reset(
		self.window_width - self.button_widht,
		0
	)
	self.ui.layout:padding(10, 10)

	if self.ui:Button("Exit", {id = 1}, self.ui.layout:row(self.button_widht, self.button_height)).hit then
		self.signal:emit("ExitGame")
	end
end

function MainGameMenu:draw()
	self.ui:draw()
end

function MainGameMenu:exit(owner)
	
end

return MainGameMenu
