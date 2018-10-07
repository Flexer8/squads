---
-- global_state.lua
--
-- Глобальное состояние системы UI
-- Нужно для прослушивания приходящих сигнаов и переключения между текущими
-- состояниями


local class = require "middleclass"


local GlobalState = class("GlobalState")

function GlobalState:initialize(data)
	self.name = GlobalState.name
	self.signal = data.signal
	self.owner = data.owner

	-- настройка получения сигналов
	self.signal:register(
		"ExitMenu",
		function()
			local fsm = self.owner:get_fsm()

			fsm:change_state(fsm:get_state("ExitMenu"))
		end
	)

	self.signal:register(
		"StartMenu",
		function()
			local fsm = self.owner:get_fsm()

			fsm:change_state(fsm:get_state("StartMenu"))
		end
	)
end

function GlobalState:enter(owner)
	-- body...
end

function GlobalState:execute(dt, owner)
	-- body...
end

function GlobalState:exit(owner)
	-- body...
end

return GlobalState
