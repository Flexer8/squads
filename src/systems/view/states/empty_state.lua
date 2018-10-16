---
-- empty_state.lua
--
-- Пустое состояние - нужно для скрытия отображения игры


local class = require "middleclass"


local EmptyView = class("EmptyView")

function EmptyView:initialize(data)
	self.name = EmptyView.name
end

function EmptyView:enter(owner)
	-- body...
end

function EmptyView:execute(dt, owner)
	-- body...
end

function EmptyView:draw()
	-- body...
end

function EmptyView:exit(owner)
	-- body...
end

return EmptyView
