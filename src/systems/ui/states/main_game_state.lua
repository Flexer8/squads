---
-- main_game_state.lua
--
-- Отображение GUI для основного состояния игры


local class = require "middleclass"

local layers_data = require "game_data.layers_data"


local MainGameMenu = class("MainGameMenu")

function MainGameMenu:initialize(data)
	self.name = MainGameMenu.name
	self.signal = data.signal
	self.ui = data.ui

	self.cursor = nil

	-- данные об окне
	self.window_width, self.window_height = love.window.getMode()

	-- Размеры отельных кнопок
	self.button_widht = 64
	self.button_height = 32
end

function MainGameMenu:enter(owner)
	-- добавление курсора
	local Cursor, Position, Image = Component.load({"Cursor", "Position", "Image"})

	self.cursor_instance = Entity()
	self.cursor_instance:add(Cursor())
	self.cursor_instance:add(Position(1, 1))
	self.cursor_instance:add(Image({img = "res/sprites/cursor01.png", layer = layers_data.cursor_layer}))

	local engine = owner:get_engine()
	engine:addEntity(self.cursor_instance)
end

function MainGameMenu:execute(dt, owner)
	self.ui.layout:reset(
		self.window_width - self.button_widht,
		0
	)
	self.ui.layout:padding(10, 10)

	if self.ui:Button("Exit", {id = 1}, self.ui.layout:row(self.button_widht, self.button_height)).hit then
		self.signal:emit("ExitGame")
	end

	-- работа с курсором
	local mouse_x = love.mouse.getX()
	local mouse_y = love.mouse.getY()

	-- получение текущей позиции
	local cur_x = math.ceil(mouse_x / owner:get_tile_size())
	local cur_y = math.ceil(mouse_y / owner:get_tile_size())

	local prev_x, perv_y = self.cursor_instance:get("Position"):get()

	if prev_x ~= cur_x or perv_y ~= cur_y then
		local screen_x, screen_y = owner:get_resolution()

		if cur_x > 0 and cur_x <= screen_x and cur_y > 0 and cur_y <= screen_y then
			self.cursor_instance:get("Cursor"):show()
		else
			self.cursor_instance:get("Cursor"):hide()
		end

		self.cursor_instance:get("Position"):set(cur_x, cur_y)
	end

	-- работа с нажатием кнопок мыши
	if love.mouse.isDown(1) then
		self.signal:emit(
			"lmb",
			self.cursor_instance:get("Position"):get_x(),
			self.cursor_instance:get("Position"):get_x()
		)
	end
end

function MainGameMenu:draw()
	self.ui:draw()
end

function MainGameMenu:exit(owner)
	-- удаление курсора
	local engine = owner:get_engine()
	engine:removeEntity(self.cursor_instance)
end

return MainGameMenu
