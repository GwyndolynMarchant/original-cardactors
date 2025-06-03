UTIL = {
    DEBUG = {},
    E = {}
}

-- Return the first index with the given value (or nil if not found).
UTIL.indexOf = function (array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

-- Return all members of the array which contain the value
UTIL.FilterKey = function (array, value)
    UTIL.DEBUG.PrintLine("Looking for "..value)
    elements = {}
    for k,_ in pairs(array) do
        UTIL.DEBUG.PrintLine("Testing " .. k)
        if string.find(k, value) then
            UTIL.DEBUG.PrintLine("Found " .. k)
            table.insert(elements, k)
        end
    end
    return elements
end

UTIL.xor = function (a, b)
    return (a and not b) or (b and not a)
end

UTIL.appendList = function (first, second)
    for i,v in ipairs(second) do
        first[#first+i] = v
    end
end

UTIL.E.GetEditionFromCard = function(card)
    if card then
        if card.edition then
            if card.edition.type then return card.edition.type
            else return card.edition end
        end
    end
    return "none"
end

UTIL.DEBUG.PrintLine = function(msg)
    sendDebugMessage(msg, "Original Cardactors")
end

UTIL.DEBUG.Print = function(name, var)
    if var then 
        if type(var) == "table" then
            UTIL.DEBUG.PrintLine(name .. " {")
            for k,v in pairs(var) do
                UTIL.DEBUG.Print(k, v)
            end
            UTIL.DEBUG.PrintLine("}")
        elseif type(var) == "boolean" then
            if var then UTIL.DEBUG.PrintLine(name .. ": true")
            else UTIL.DEBUG.PrintLine(name .. ": false") end
        else
            UTIL.DEBUG.PrintLine(name .. ": " .. var)
        end
    else
        UTIL.DEBUG.PrintLine(name .. ": NIL")
    end
end