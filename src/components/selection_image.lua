---
-- selection_image.lua
--
-- Компонент с отображение выделения на юните
-- Как две капли воды похож на обычный Image


local class = require "middleclass"

local layers_data = require "game_data.layers_data"


local SelectionImage = class("SelectionImage")

function SelectionImage:initialize(data)
	self.img = data.img
	self.layer = layers_data.selection_layer
end

---
-- Получить спрайт
--
-- @return[type=string] Путь до спрайта
function SelectionImage:get_img()
	return self.img
end

---
-- Слой, на котором нужно отображать спрайт
--
-- @return[type=integer] Номер слоя для отображения
function SelectionImage:get_layer()
	return self.layer
end

return SelectionImage
