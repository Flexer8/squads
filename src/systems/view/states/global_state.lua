---
-- global_state.lua
--
-- Глобальное состояние системы отображения игрового мира
-- обрабатывает все переключения состояний


local class = require "middleclass"


local GlobalState = class("GlobalState")

function GlobalState:initialize(data)
	self.name = GlobalState.name
	self.signal = data.signal
	self.owner = data.owner

	self.signal:register(
		"MainGame",
		function()
			local fsm = self.owner:get_fsm()

			fsm:change_state(fsm:get_state("MainView"))
		end
	)

	self.signal:register(
		"HideGameView",
		function()
			local fsm = self.owner:get_fsm()

			fsm:change_state(fsm:get_state("EmptyView"))
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
