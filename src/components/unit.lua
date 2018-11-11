---
-- unit.lua
--
-- Компонент с данными о любом юните


local class = require "middleclass"

local layers_data = require "game_data.layers_data"


local Unit = class("Unit")

function Unit:initialize(data)
	self.SelectionImage = Component.load({"SelectionImage"})

	self.owner = data.owner

	self.selected = false
end

---
-- Выбрать юнит
function Unit:select()
	self.selected = true

	self.owner:add(self.SelectionImage({img = "res/sprites/unit_selection.png"}))
end

---
-- Проверка, выбран ли юнит
--
-- @return[type=boolean] true/false
function Unit:is_selected()
	return self.selected
end

---
-- Снять выделение с юнита
function Unit:unselect()
	self.selected = false

	if self.owner:has("SelectionImage") then
		self.owner:remove("SelectionImage")
	end
end

return Unit
