
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

    self:UpdateGame()

end

--[[
--
-- 加载进度条
--
-- --]]
function MainScene:UpdateGame()

    local IMG = require('data/image')

    local bg = cc.Sprite:create(IMG.PROGRESS_BACKGROUND)
    bg:setPosition(cc.p(display.width/2, display.height * 0.08))
    self:addChild(bg)

    local to1 = cc.ProgressTo:create(5, 100)
    local left = cc.ProgressTimer:create(cc.Sprite:create(IMG.PROGRESS_FRONT_RED))
    left:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    -- Setup for a bar starting from the left since the midpoint is 0 for the x
    left:setMidpoint(cc.p(0, 0))
    -- Setup for a horizontal bar since the bar change rate is 0 for y meaning no vertical change
    left:setBarChangeRate(cc.p(1, 0))
    left:setPosition(cc.p(display.width/2, display.height * 0.08))
    left:runAction(cc.RepeatForever:create(to1))
    self:addChild(left)


    --显示百分比
    local percerntLabel = cc.Label:createWithSystemFont("0%", "Arial", 20)
    percerntLabel:setColor(display.COLOR_BLACK)
    percerntLabel:move(display.cx, display.height * 0.12)
    percerntLabel:addTo(self)


    --添加定时事件  到事件触发

    local scheduler = cc.Director:getInstance():getScheduler()
    local i = 0
    local scheduleEntry = nil
    scheduleEntry = scheduler:scheduleScriptFunc(function(dt)
        i=i+1
        percerntLabel:setString(i..'%')
        if i == 100 then
            scheduler:unscheduleScriptEntry(scheduleEntry)

            --跳转场景
        end
    end,0.05,false)
end



return MainScene
