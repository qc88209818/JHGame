
require "luaSprite/SceneManager"

local sm = sm
local class = newclass("g")
sm.mainScene = class

local LINE_SPACE = 80
local curPos = {x = 0, y = 0 }
local nowScene

local mainDetail =
{
    "基础能力",
    "心智技能",
    "互动技能",
    "生理技能",
    "衍生属性",
    "奖励物品",
}

local function createMainMenu()

    local function menuCallback(tag)
        print(tag)
    end

    local count = table.getn(mainDetail)
    local pos   = CCDirector:sharedDirector():getWinSize()
    local menu  = CCMenu:create()
    local layer = CCLayer:create()

    for index, name in pairs(mainDetail) do
        local testLabel = CCLabelTTF:create(name, "宋体", 30)
        local testMenuItem = CCMenuItemLabel:create(testLabel)
        testMenuItem:registerScriptTapHandler(menuCallback)
        testMenuItem:setPosition(ccp(pos.width/2, (pos.height - 100 - (index)*LINE_SPACE)))
        menu:addChild(testMenuItem, index + 10000, index + 10000)
    end

    menu:setContentSize(CCSizeMake(pos.width, (count + 1) * (LINE_SPACE)))
    menu:setPosition(curPos.x, curPos.y)
    layer:addChild(menu)

    return layer
end
class.createMenu = createMainMenu


local function testCallback(tag)
    print(tag)
end

local xxx =
{
    { t = "pic",    res = "picture/bg.jpg", },
    { t = "label",  text = "123456", size = "30", pos = {x=100, y=100}, },
   --{ t = "picbtn", normal = "picture/bg.jpg", press = "picture/bg.jpg", disable = "picture/bg.jpg", click_func = testCallback},
}

local function create()
    local scene = CCScene:create()

    local layer = newlayer(xxx)
    scene:addChild(layer)

    return scene
end
class.create = create

