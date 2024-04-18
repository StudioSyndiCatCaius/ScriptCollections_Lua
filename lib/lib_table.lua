-- Extended Table Library

function table.shallowCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end


function table.deepCopy(original)
    local original_type = type(original)
    local copy
    if original_type == 'table' then
        copy = {}
        for original_key, original_value in next, original, nil do
            copy[table.deepCopy(original_key)] = table.deepCopy(original_value)
        end
        setmetatable(copy, table.deepCopy(getmetatable(original)))
    else -- for number, string, boolean, etc.
        copy = original
    end
    return copy
end


function table.removeDuplicates(tbl)
    local unique = {}
    local result = {}

    for i, v in ipairs(tbl) do
        if not unique[v] then
            table.insert(result, v)
            unique[v] = true
        end
    end

    return result
end

--- func desc
---@param t1 table
---@param t2 table
---@param unique boolean
function table.appendTablesvalues(t1, t2, unique)
    -- Iterate over the second table
    for i = 1, #t2 do
        -- Append each element of t2 to t1
        t1[#t1 + 1] = t2[i]
    end

    if unique then
        return table.removeDuplicates(t1)
    end
    return t1
end