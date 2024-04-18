HOOKS={}

---@param hook string
---@param name string
---@param func function
function HOOK_ADD(hook,name,func)
    if not (HOOKS[hook]) then
        HOOKS[hook]={}
    end
    HOOKS[hook][name]=func
end

---@param hook string
---@param name string
function HOOK_REMOVE(hook,name)
    if HOOKS[hook] and HOOKS[hook][name] then
        HOOKS[hook][name]=nil
    end
end

---@param hook string
function HOOK_CALL(hook,meta)
    if HOOKS[hook] then
        print("Called Hook : "..hook.." with meta: "..tostring(meta))
        for key, value in pairs(HOOKS[hook]) do
            print("   run hook event: "..key.." ")
            value(meta)
        end
    end
end

