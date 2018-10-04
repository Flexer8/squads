---
-- logger.lua
--
-- Модуль логирования.
-- Работа основана на библиотеке log.lua


local class = require "middleclass"
local Log = require "log"
local LIP = require "LIP"


local Logger = class("Logger")

function Logger:initialize()
    local config = LIP.load(global_config_path)

    Log.usecolor = false
    Log.console_writer = false
    Log.outfile = config.logging.file
    Log.level = config.logging.level
end

function Logger:trace(msg)
    Log.trace(msg)
end

function Logger:debug(msg)
    Log.debug(msg)
end

function Logger:info(msg)
    Log.info(msg)
end

function Logger:warn(msg)
    Log.warn(msg)
end

function Logger:error(msg)
    Log.error(msg)
end

function Logger:fatal(msg)
    Log.fatal(msg)
end

return Logger
