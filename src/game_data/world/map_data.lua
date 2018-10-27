---
-- map_data.lua
--
-- Модуль рлучения данных о карте для отображения ее на экране


local class = require "middleclass"


local MapData = class("MapData")

function MapData:initialize(data)
	self.sti_data = {
	  version = "1.1",
	  luaversion = "5.1",
	  tiledversion = "1.1.6",
	  orientation = "orthogonal",
	  renderorder = "right-down",
	  width = nil,
	  height = nil,
	  tilewidth = 32,
	  tileheight = 32,
	  nextobjectid = 1,
	  properties = {},
	  tilesets = {
	    {
	      name = "simple01",
	      firstgid = 1,
	      tilewidth = 32,
	      tileheight = 32,
	      spacing = 0,
	      margin = 0,
	      image = "res/tilesets/simple01.png",
	      imagewidth = 64,
	      imageheight = 32,
	      tileoffset = {
	        x = 0,
	        y = 0
	      },
	      grid = {
	        orientation = "orthogonal",
	        width = 32,
	        height = 32
	      },
	      properties = {},
	      terrains = {},
	      tilecount = 2,
	      tiles = {}
	    }
	  },
	  layers = {
	    {
	      type = "tilelayer",
	      name = "TileLayer01",
	      x = 0,
	      y = 0,
	      width = nil,
	      height = nil,
	      visible = true,
	      opacity = 1,
	      offsetx = 0,
	      offsety = 0,
	      properties = {},
	      encoding = "lua",
	      data = nil
	    }
	  }
	}
end

---
-- Получение карты для отображения
--
-- @param[type=table] Объект Grid с картой
-- @return[type=table] Структура, еобходимая для отображения
function MapData:get_map(map)
	self.sti_data.width = map:getWidth()
	self.sti_data.height = map:getHeight()

	local data = {}

	for node, count in map:iter() do
		table.insert(data, node.cell:get_view_tile())
	end

	local layers = self.sti_data.layers

	for _, layer in ipairs(layers) do
		if layer.name == "TileLayer01" then
			layer.width = map:getWidth()
			layer.height = map:getHeight()
			layer.data = data
		end
	end

	return self.sti_data
end

return MapData
