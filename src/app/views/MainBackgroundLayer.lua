--
-- Created by IntelliJ IDEA.
-- User: zhangcheng
-- Date: 16/5/31
-- Time: 上午12:12
-- To change this template use File | Settings | File Templates.
--

local MainBackgroundLayer = class('MainBackgroundLayer', function()
    return cc.Layer:create()
end)

MainBackgroundLayer.parentNode = nil

function MainBackgroundLayer:setParent(parentNode)
    self.parentNode  = parentNode
end

function MainBackgroundLayer:getParent()
    return self.parentNode
end

function MainBackgroundLayer:ctor()

    local IMG = require("data.image")

    local background = display.newSprite(IMG.BG)
    background:move(display.center):addTo(self)


end


return MainBackgroundLayer