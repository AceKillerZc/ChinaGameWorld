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
    local t = {IMG.QING,IMG.QI,IMG.SHU,IMG.HUA }

    return t[index]

end

local function getImgWordWithIndex(index)
    local item_word = {'音乐','围棋','小说','美图' }
    return item_word[index]
end



function MainListLayer:setParent(parentNode)
    self.parentNode  = parentNode
end

function MainListLayer:getParent()
    return self.parentNode
end


--tableview 设置
function MainListLayer.scrollViewDidScroll(view)
    print("scrollViewDidScroll")
end

function MainListLayer.scrollViewDidZoom(view)
    print("scrollViewDidZoom")
end

function MainListLayer.tableCellTouched(table,cell)
    print("按到了 选项 " .. getImgWordWithIndex(cell:getIdx()+1))
end

function MainListLayer.cellSizeForTable(table,idx)
    return 120,130
end




function MainListLayer.tableCellAtIndex(table, idx)
    local strValue = string.format("%d",idx)
    print(strValue)
    local cell = table:dequeueCell()
    local label = nil
    if nil == cell then
        cell = cc.TableViewCell:new()
        local sprite = cc.Sprite:create(getImgWithIndex(idx+1))
        sprite:setAnchorPoint(cc.p(0.5,0.5))
        sprite:setPosition(cc.p(60, 70))
        cell:addChild(sprite)

        label = cc.Label:createWithSystemFont(getImgWordWithIndex(idx+1), "Arial", 16.0)
        label:setColor(display.COLOR_WHITE)
        label:setPosition(cc.p(60,0))
        label:setAnchorPoint(cc.p(0.5,0))
        label:setTag(idx)
        cell:addChild(label)
    else
        label = cell:getChildByTag(idx)
        if nil ~= label then
            label:setString(strValue)
        end

        print('选择的是'..idx)
    end

    return cell
end

function MainListLayer.numberOfCellsInTableView(table)
    return 4
end


function MainListLayer:init()
    local winSize = cc.Director:getInstance():getWinSize()

    local tableView = cc.TableView:create(cc.size(120, 520))
    tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    tableView:setPosition(cc.p(0, winSize.height/2 - 260 ))
    tableView:setDelegate()
    tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self:addChild(tableView)
    tableView:registerScriptHandler(MainListLayer.scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    tableView:registerScriptHandler(MainListLayer.scrollViewDidZoom,cc.SCROLLVIEW_SCRIPT_ZOOM)
    tableView:registerScriptHandler(MainListLayer.tableCellTouched,cc.TABLECELL_TOUCHED)
    tableView:registerScriptHandler(MainListLayer.cellSizeForTable,cc.TABLECELL_SIZE_FOR_INDEX)
    tableView:registerScriptHandler(MainListLayer.tableCellAtIndex,cc.TABLECELL_SIZE_AT_INDEX)
    tableView:registerScriptHandler(MainListLayer.numberOfCellsInTableView,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    tableView:reloadData()


end

function MainListLayer:ctor()
    self:init()
end


return MainListLayer