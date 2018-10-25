---
-- cursor.lua
--
-- Компонент, определяющий курсор


local class = require "middleclass"


local Cursor = class("Cursor")

function Cursor:initialize(data)
	self.visible = true
end

---
-- Виден ли курсор на экране
--
-- @return[type=boolean] True если виден
function Cursor:is_visible()
	return self.visible
end

---
-- Отобразить курсор
function Cursor:show()
	self.visible = true
end

---
-- Скрыть курсор
function Cursor:hide()
	self.visible = false
end

return Cursor
