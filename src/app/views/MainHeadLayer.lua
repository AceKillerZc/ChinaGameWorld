--
-- Created by IntelliJ IDEA.
-- User: zhangcheng
-- Date: 16/5/26
-- Time: 下午8:19
-- To change this template use File | Settings | File Templates.
--
local MainHeadLayer = class('MainHeadLayer', function()
    return cc.Layer:create()
end)

MainHeadLayer.parentNode = nil


function MainHeadLayer:setParent(parentNode)
    self.parentNode  = parentNode
end

function MainHeadLayer:getParent()
    return self.parentNode
end


return MainHeadLayer