---
-- image.lua
--
-- Компонент, отображение Объекта на экране


local class = require "middleclass"


local Image = class("Image")

function Image:initialize(data)
	self.img = data.img
	self.layer = data.layer
end

---
-- Получить спрайт
--
-- @return[type=string] Путь до спрайта
function Image:get_img()
	return self.img
end

---
-- Слой, на котором нужно отображать спрайт
--
-- @return[type=integer] Номер слоя для отображения
function Image:get_layer()
	return self.layer
end

return Image
