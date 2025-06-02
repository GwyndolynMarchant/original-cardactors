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

UTIL.xor = function (a, b)
    return (a and not b) or (b and not a)
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

UTIL.DEBUG.Print = function(name, var)
    if var then 
        if type(var) == "table" then
            sendDebugMessage(name .. ": <table>")
        else
            sendDebugMessage(name .. ": " .. var)
        end
    end
end