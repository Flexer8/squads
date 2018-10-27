---
-- cell_factory.lua
--
-- Фабрика, возвращающая ячейки для карты


local class = require "middleclass"

local Cell = require "game_data.world.cell.cell"


local CellFactory = class("CellFactory")

function CellFactory:initialize()
	-- body...
end

---
-- Получение ячейки по названию
--
-- @param name[type=str] Название ячейки, которое необходимо Получить
-- @return[type=table] Объект ячейки Cell
function CellFactory:get_cell(name)
	if name == "Mud" or name == "." then
		return Cell({view = 1})
	elseif name == "Grass" or name ==  "," then
		return Cell({view = 2})
	end
end

return CellFactory
