---
-- starter_menu_state.lua
--
-- Состояние стартового меню


local class = require "middleclass"


local StarterMenu = class("StarterMenu")

function StarterMenu:initialize(data)
	self.name = StarterMenu.name
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

function StarterMenu:enter(owner)
	self.signal:emit("StartMenu")
end

function StarterMenu:execute(dt, owner)
	if self.to_exit then
		self.to_exit = false

		local fsm = owner:get_fsm()
		fsm:change_state(fsm:get_state("ExitGame"))
	end
end

function StarterMenu:exit(owner)
	-- body...
end

return StarterMenu
