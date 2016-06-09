--
-- Created by IntelliJ IDEA.
-- User: zhangcheng
-- Date: 16/5/30
-- Time: 下午11:53
-- To change this template use File | Settings | File Templates.
--

-- 游戏选择场景

local SelectScene = class('SelectScene',cc.load("mvc").ViewBase)

SelectScene.MainHeadLayer = nil
SelectScene.MainListLayer = nil
SelectScene.MainBackgroundLayer = nil


local mainHeadLayer = require("app.views.MainHeadLayer")
local mainListLayer = require("app.views.MainListLayer")
local mainBackgroundLayer = require("app.views.MainBackgroundLayer")


function SelectScene:onCreate()


    self.MainHeadLayer =  mainHeadLayer:create()
    self.MainListLayer =  mainListLayer:create()
    self.MainBackgroundLayer = mainBackgroundLayer:create()


    self.MainBackgroundLayer:setTag(1)
    self.MainHeadLayer:setTag(2)
    self.MainListLayer:setTag(3)

    self.MainBackgroundLayer:setParent(self)
    self.MainHeadLayer:setParent(self)
    self.MainListLayer:setParent(self)


    self:addChild(self.MainBackgroundLayer)
    self:addChild(self.MainHeadLayer)
    self:addChild(self.MainListLayer)
end


return SelectScene