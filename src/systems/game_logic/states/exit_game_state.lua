---
-- exit_game_state.lua
--
-- Состояние, обрабатывающее меню выхода из игры


local class = require "middleclass"


local ExitGame = class("ExitGame")

function ExitGame:initialize(data)
	self.name = ExitGame.name
	self.signal = data.signal

	-- флаги
	self.exit_game = false
	self.return_previouse = false

	-- сигналы
	self.signal:register(
		"Exit",
		function()
			self.exit_game = true
		end
	)

	self.signal:register(
		"Return",
		function()
			self.return_previouse = true
		end
	)
end

function ExitGame:enter(owner)
	self.signal:emit("ExitMenu")
end

function ExitGame:execute(dt, owner)
	if self.exit_game then
		self.exit_game = false

		love.event.quit()
	end

	if self.return_previouse then
		self.return_previouse = false

		local fsm = owner:get_fsm()
		fsm:return_previouse_state()
	end
end

function ExitGame:exit(owner)
	-- body...
end

return ExitGame
