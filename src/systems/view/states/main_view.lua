---
-- main_view.lua
--
-- Состояние GUI с отображением основного интерфейса игры


local class = require "middleclass"
local sti = require "sti"

local layers_data = require "game_data.layers_data"


local MainView = class("MainView")

function MainView:initialize(data)
	self.name = MainView.name

	self.map = nil
end

function MainView:enter(owner)
	if not self.map then
		local world = owner:get_world()

		self.map = sti(world:map_to_draw())
	end

	-- Отображение юнитов
	local unit_layer = self.map:addCustomLayer("unit", layers_data.unit_layer)

	unit_layer.draw = function(s)
		local tergets = owner:get_targets()

		for _, entity in ipairs(tergets) do
			if entity:get("Image"):get_layer() == layers_data.unit_layer then
				local cursor = love.graphics.newImage(entity:get("Image"):get_img())

				if entity:get("Unit") then
					love.graphics.draw(
						cursor,
						(entity:get("Position"):get_x() * owner:get_tile_size()) - owner:get_tile_size(),
						(entity:get("Position"):get_y() * owner:get_tile_size()) - owner:get_tile_size()
					)
				end
			end
		end
	end

	-- Отображение курсора
	local cursor_layer = self.map:addCustomLayer("cursour", layers_data.cursor_layer)

	cursor_layer.draw = function(s)
		local tergets = owner:get_targets()

		for _, entity in ipairs(tergets) do
			if entity:get("Image"):get_layer() == layers_data.cursor_layer then
				local cursor = love.graphics.newImage(entity:get("Image"):get_img())

				if entity:get("Cursor"):is_visible() then
					love.graphics.draw(
						cursor,
						(entity:get("Position"):get_x() * owner:get_tile_size()) - owner:get_tile_size(),
						(entity:get("Position"):get_y() * owner:get_tile_size()) - owner:get_tile_size()
					)
				end
			end
		end
	end
end

function MainView:execute(dt, owner)
	self.map:update(dt)
end

function MainView:draw()
	self.map:draw()
end

function MainView:exit(owner)
	-- body...
end

return MainView
