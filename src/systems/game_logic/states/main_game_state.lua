---
-- main_game_state.lua
--
-- Основное игровоне состояние


local class = require "middleclass"


local MainGame = class("MainGame")

function MainGame:initialize(data)
	self.name = MainGame.name
	self.signal = data.signal

	-- флаги переключения состояний
	self.to_exit = false

	-- работа с сигналами
	self.signal:register(
		"ExitGame",
		function()
			self.to_exit = true
		end
	)
end

function MainGame:enter(owner)
	self.to_exit = false

	local world = owner:get_world()
	world:load_world()

	self.signal:emit("MainGame")
end

function MainGame:execute(dt, owner)
	if self.to_exit then
		self.to_exit = false

		local fsm = owner:get_fsm()
		fsm:change_state(fsm:get_state("ExitGame"))
	end
end

function MainGame:exit(owner)
	self.signal:emit("HideGameView")
end

return MainGame
