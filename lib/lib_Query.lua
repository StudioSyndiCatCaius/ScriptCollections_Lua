Query={}

---@param query string
---@param name string
---@param func function
function Query.Add(query,name,func)
    if not (Query[query]) then
        HOOKS[query]={}
    end
    HOOKS[query][name]=func
end

---@param query string
---@param name string
function Query.Remove(query,name)
    if Query[query] and Query[query][name] then
        -- remove query
    end
end

---@param query string
function Query.Call(query,meta)
    if Query[query] then
        for key, value in pairs(Query[query]) do
            if value(meta) == false then
                return false
            end
        end
    end
    return true
end

