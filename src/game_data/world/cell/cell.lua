---
-- cell.lua
--
-- Данные об отдельной ячейке на карте


local class = require "middleclass"


local Cell = class("Cell")

function Cell:initialize(data)
	self.viewed_cell = data.view
end

---
-- Получить тип тайла для отображения
function Cell:get_view_tile()
	return self.viewed_cell
end

return Cell
