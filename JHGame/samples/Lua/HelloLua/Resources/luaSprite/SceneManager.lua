
sm = {}

newclass = function( superclass )
    local class = {}
    class.__index = class
    if type(superclass) == "table" then
        setmetatable(class, superclass)
    elseif type(superclass) == "string" then
        if superclass == "g" then
            setmetatable(class, {__index = _G})
        end
    end
    return class
end

newlayer = function(layer)
    if type(layer) ~= "table" then return nil end

    local node
    local result = CCLayer:create()
    for _, obj in pairs(layer) do
        local type   = obj.t      or "unknow"
        local pos    = obj.pos    or ccp(0, 0)
        local anchor = obj.anchor or ccp(0.5, 0.5)

        --label
        if type == "label" then
            local text = obj.text or ""
            local font = obj.font or "宋体"
            local size = obj.size or 16
            node = CCLabelTTF:create(text, font, size)

        --pic
        elseif type == "pic" then
            local res = obj.res or ""
            node = CCSprite:create(res)

        --[[picbtn
        elseif type == "picbtn" then
            local normal  = obj.normal  or ""
            local press   = obj.press   or ""
            local disable = obj.disable or ""
            local func    = obj.click_func
            node = CCMenuItemImage:create(normal, press, disable)
            ]]
        end

        if type ~= "unknow" then
            node:setPosition(ccp(pos.x, pos.y))
            node:setAnchorPoint(ccp(anchor.x, anchor.y))
            result:addChild(node)
        end
    end
    return result
end