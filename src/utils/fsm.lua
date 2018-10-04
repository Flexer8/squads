---
-- fsm.lua
--
-- Реализация конечного автомата в виде отдельного класса


local class = require "middleclass"


local FSM = class("FSM")

function FSM:initialize(data)
    self.owner = nil

    if data then
        if data.owner then
            self.owner = data.owner
        end
    end

    self.current_state = nil
    self.previouse_state = nil
    self.global_state = nil

    self.states = {}
end

---
-- добавление владельца конечного автомата
--
-- @param owner владелец
function FSM:add_owner(owner)
    self.owner = owner
end

---
-- Добавить доступное состояние в конечный автомат
--
-- @param state[type=table] новое состояние
function FSM:add_state(state)
    table.insert(self.states, state)
end

---
-- Получить состояние из доступных по имени
--
-- @param name[type=str] имя требуемого состояния
-- @return[type=table] запрошенное состояние
function FSM:get_state(name)
    for _, state in ipairs(self.states) do
        if state.name == name then
            return state
        end
    end

    error("Состояние с именем " .. name .. " не определено в конечном автомате!!")
end

---
-- Обновление состояния коечного автомата в течении каждого шага
--
-- @param data данные, передаваемые в конечный автомат
function FSM:update(dt)
    if self.global_state then
        self.global_state:execute(dt, self.owner)
    end

    if self.current_state then
        self.current_state:execute(dt, self.owner)
    end
end

---
-- Проверка, что Конечный автомат находится в данном состоянии
--
-- @param state состояние, на соответствие которому проверяется
-- @return true если конечный автомат в данном состоянии, иначе false
function FSM:is_in_state(state)
    if self.current_state.name == state.name then
        return true
    else
        return false
    end
end

---
-- Сменить состояние конечного автомата
--
-- @param state состояние, на которое необходимо сменить
function FSM:change_state(state)
    if self.current_state then
        self:set_previouse_state(self.current_state)

        self.previouse_state:exit(self.owner)
    end

    self:set_current_state(state)

    self.current_state:enter(self.owner)
end

---
-- Вернуть предыдущее состояние Конечного автомата
function FSM:return_previouse_state()
    self:change_state(self.previouse_state)
end

---
-- Установка текущего состояния
--
-- @param state состояние, которое нужно установить
function FSM:set_current_state(state)
    self.current_state = state
end

---
-- Установка предыдущего состояния
--
-- @param state состояние, которое нужно установить
function FSM:set_previouse_state(state)
    self.previouse_state = state
end

---
-- Установка глобального состояния
--
-- @param state состояние, которое нужно установить
function FSM:set_global_state(state)
    self.global_state = state
end

---
-- Получение текущего состояния конечного автомата
--
-- @return текущее состояние
function FSM:get_current_state()
    return self.current_state
end

---
-- Получене предыдущего состояния кончного автомата
--
-- @return предыдущее состояние
function FSM:get_previouse_state()
    return self.previouse_state
end

---
-- Получение глобального состояния конечного автомата
--
-- @return глобальное состояние
function FSM:get_global_state()
    return self.global_state
end

return FSM
