
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

--此场景做开始的过度场景
function MainScene:onCreate()
    -- add background image

    display.newLayer(display.COLOR_WHITE)
        :addTo(self)


    local IMG = require('data/image')
    local background = display.newSprite(IMG.INDEX)
    background:setOpacity(0)
    background:move(display.center)
        :addTo(self)
    -- fade in
    transition.fadeIn(background,{time=5})


    local MUSIC = require('data/music')
    audio.playMusic(MUSIC.INDEX,true)


    -- add HelloWorld label
    -- cc.Label:createWithSystemFont("Hello World", "Arial", 40)
    --    :move(display.cx, display.cy + 200)
    --    :addTo(self)


end

--[[
--
-- 加载进度条
--
-- --]]
function MainScene:UpdateGame()


end



return MainScene
