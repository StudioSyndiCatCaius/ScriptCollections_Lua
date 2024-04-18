Util={}

-- =========================================================================
-- TABLES
-- =========================================================================
function Util.Table_FilterByField(tbl, fieldName, fieldValue)
    local filtered = {}
    for _, item in ipairs(tbl) do
        if item[fieldName] == fieldValue then
            table.insert(filtered, item)
        end
    end
    return filtered
end


function Util.Table_KeysToValues(tbl_in)
    local out={}

    for key, value in pairs(tbl_in) do
        
        table.insert(out,key)
    end
    
    return out
end

---@param tbl table
---@param Keys table
function Util.Table_FilterByKeys(tbl, Keys)
    local filtered = {}
    for key, item in pairs(tbl) do
        if Util.Table_HasValue(Keys,key) then
            filtered[key]=item
        end
    end
    return filtered
    
end


--Filter a Table from functions
function Util.Table_Filter(tbl, filterFunc,meta)
    print("started table filter")
    if (filterFunc==nil) then
        print("filter function was invalid. returning full table")
        return tbl
    end
    
    local filteredTbl = {}
    for key, value in pairs(tbl) do
        print("starting filter with key values: "..key)
        if filterFunc(key, value,meta) then
            filteredTbl[key]=value
        end
    end
    return filteredTbl
end

--Filter a Table from functions
function Util.Table_Sort(tbl, sort_function, reverse, meta)
    local new_table = tbl

    local function sortingFunction(a, b)
        return sort_function(a, b, meta)
    end


    if reverse then
        table.sort(new_table, function(a, b)
            return not sortingFunction(a, b)
        end)
    else
        table.sort(new_table, sortingFunction)
    end
    return new_table
end

function Util.Table_findIndex(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return -1 -- Return nil if the value is not found
end

function Util.Table_HasValue(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end



function Util.Table_copy(t)
    local u = { }
    for k, v in pairs(t) do u[k] = v end
    return setmetatable(u, getmetatable(t))
  end

-- ==============================================
-- Translation
-- ==============================================
Util.Culture_default="en"
Util.Culture_current="en"

---localizes a string based on current culture. Will return if just a string,
function LOC(string)
    if type(string) == "string" then
        return string
    end
    if (string[Util.Culture_current]) then
        return string[Util.Culture_current]
    end
    if (string[Util.Culture_default]) then
        return string[Util.Culture_default]
    end
    return ""
end


-- ==============================================
-- MATH
-- ==============================================
function RNG(chance)
    if not type(chance)=="number" then
        return false
    end
    local val = math.random()
    return (val<=chance)
end




return Util

