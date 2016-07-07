--
-- Created by IntelliJ IDEA.
-- User: zhangcheng
-- Date: 16/5/26
-- Time: 下午8:21
-- To change this template use File | Settings | File Templates.
--
local MainListLayer = class('MainListLayer',function()
    return cc.Layer:create()
end)

MainListLayer.parentNode = nil

local IMG = require('data/image')

--定义tableview 每个选项
local function getImgWithIndex(index)
    local t = {IMG.QING,IMG.QI,IMG.SHU,IMG.HUA,IMG.SHI,IMG.JIU,IMG.FLOWER,IMG.CHA,IMG.LI,IMG.YUE,IMG.SHE,IMG.YU,IMG.SHU,IMG.NUMBER }

    return t[index]

end

local function getImgWordWithIndex(index)
    local item_word = {'音乐','围棋','小说','美图','诗','酒','花','茶','礼','乐','射','御','书','数' }
    return item_word[index]
end
local _cells = {}

local function saveCell(idx,cell)
    _cells[idx] = cell
end

local function getCell(idx)
    return _cells[idx]
end

function MainListLayer:setParent(parentNode)
    self.parentNode  = parentNode
end

function MainListLayer:getParent()
    return self.parentNode
end


--tableview 设置
function MainListLayer.scrollViewDidScroll(view)
    --print("scrollViewDidScroll")
end

function MainListLayer.scrollViewDidZoom(view)
    --print("scrollViewDidZoom")
end

function MainListLayer:changeBackground(idx)

end


function MainListLayer:tableCellTouched(table,cell)
    printInfo("按到了 选项 " .. getImgWordWithIndex(cell:getIdx()+1))

    self:changeBackground(idx)
    local parent = self:getParent()
    local sp = display.newSprite(IMG.INDEX)
    parent:getBackground():refresh(sp)
end

function MainListLayer.cellSizeForTable(table,idx)
    return 120,130
end




function MainListLayer.tableCellAtIndex(table, idx)
    local strValue = string.format("%d",idx)
    printInfo('tableCellAtIndex--'..strValue)
    local cell = getCell(idx)
    local label = nil

    if nil == cell then
        cell = cc.TableViewCell:new()
        local name = getImgWithIndex(idx+1)
        printInfo('创建图形文件名称---'..name)
        local sprite = cc.Sprite:create(name)
        sprite:setAnchorPoint(cc.p(0.5,0.5))
        sprite:setPosition(cc.p(60, 70))
        cell:addChild(sprite)

        label = cc.Label:createWithSystemFont(getImgWordWithIndex(idx+1), "Arial", 16.0)
        label:setColor(display.COLOR_WHITE)
        label:setPosition(cc.p(60,0))
        label:setAnchorPoint(cc.p(0.5,0))
        label:setTag(idx)
        cell:setTag(idx)
        cell:addChild(label)

        saveCell(idx,cell)
    else
        printInfo('选择的是'..idx)
    end

    return cell
end

function MainListLayer.numberOfCellsInTableView(table)
    return 14
end


function MainListLayer:init()
    local winSize = cc.Director:getInstance():getWinSize()

    local tableView = cc.TableView:create(cc.size(120, winSize.height - 120))
    tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    tableView:setPosition(cc.p(0, 0 ))
    tableView:setDelegate()
    tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self:addChild(tableView)
    tableView:registerScriptHandler(MainListLayer.scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    tableView:registerScriptHandler(MainListLayer.scrollViewDidZoom,cc.SCROLLVIEW_SCRIPT_ZOOM)
    tableView:registerScriptHandler(function(table,cell) self:tableCellTouched(table,cell) end,cc.TABLECELL_TOUCHED)
    tableView:registerScriptHandler(MainListLayer.cellSizeForTable,cc.TABLECELL_SIZE_FOR_INDEX)
    tableView:registerScriptHandler(MainListLayer.tableCellAtIndex,cc.TABLECELL_SIZE_AT_INDEX)
    tableView:registerScriptHandler(MainListLayer.numberOfCellsInTableView,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    tableView:reloadData()


end

function MainListLayer:ctor()

    self:init()
end



return MainListLayer