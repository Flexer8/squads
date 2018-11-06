---
-- cell.lua
--
-- Данные об отдельной ячейке на карте


local class = require "middleclass"


local Cell = class("Cell")

function Cell:initialize(data)
	self.viewed_cell = data.view
	self.unit = nil
end

---
-- Получить тип тайла для отображения
function Cell:get_view_tile()
	return self.viewed_cell
end

---
-- Добавить юнит в ячейку карты
--
-- @param unit[type=table] Юнит, который нужно поместить на карту
function Cell:add_unit(unit)
	if not self:is_unit() then
		self.unit = unit
	end
end

---
-- Проверка, есть ли на данной ячейке юнит
--
-- @return[type=boolean] true/false есть ли юнит на этой позиции
function Cell:is_unit()
	if self.unit then
		return true
	else
		return false
	end
end

---
-- Получить юнит из ячейки (ссылка на юнит остается)
--
-- @return[type=table] Юнит
function Cell:get_unit()
	if self:is_unit() then
		return self.unit
	end
end

---
-- Получить юнит из ячейки с удалением
--
-- @return[type=table] Юнит
function Cell:remove_unit()
	if self:is_unit() then
		local unit = self.unit
		self.unit = nil

		return unit
	end
end

return Cell
