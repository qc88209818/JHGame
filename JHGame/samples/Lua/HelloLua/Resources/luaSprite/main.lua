
require "luaSprite/mainScene"

local function mainRun()
    local scene = sm.mainScene:create()
    CCDirector:sharedDirector():runWithScene(scene)
end

mainRun()