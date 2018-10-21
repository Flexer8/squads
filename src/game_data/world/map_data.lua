---
-- map_data.lua
--
-- Модуль рлучения данных о карте для отображения ее на экране


local class = require "middleclass"


local MapData = class("MapData")

function MapData:initialize(data)
	-- body...
end

function MapData:get_map()
	return {
	  version = "1.1",
	  luaversion = "5.1",
	  tiledversion = "1.1.6",
	  orientation = "orthogonal",
	  renderorder = "right-down",
	  width = 20,
	  height = 15,
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
	      name = "Слой тайлов 1",
	      x = 0,
	      y = 0,
	      width = 20,
	      height = 15,
	      visible = true,
	      opacity = 1,
	      offsetx = 0,
	      offsety = 0,
	      properties = {},
	      encoding = "lua",
	      data = {
	        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1,
	        1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1,
	        1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1,
	        1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1
	      }
	    }
	  }
	}
end

return MapData
