---
-- position.lua
--
-- Компонент, определяющий позицию объекта в игре
-- Позиция привязана к сетке координа игрового мира


local class = require "middleclass"


local Position = class("Position")

function Position:initialize(x, y)
	self.x = nil
	self.y = nil

	self:set(x, y)
end

---
-- установить позицию
--
-- @param x[type=integer] Х координа
-- @param y[type=integer] У координа
function Position:set(x, y)
	self.x = x
	self.y = y
end

---
-- Получить позицию объекта
--
-- @return[type=integer] Х и У позиция
function Position:get()
	return self.x, self.y
end

---
-- Получить Х координату
--
-- @return[type=integer] Х  позиция
function Position:get_x()
	return self.x
end

---
-- Получить Y координату
--
-- @return[type=integer] Y  позиция
function Position:get_y()
	return self.y
end

return Position
