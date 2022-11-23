local M = {}

function M.filter(arr, fn)
    if type(arr) ~= "table" then
        return arr
    end

    local filtered = {}

    for k, v in pairs(arr) do
        if fn(v, k, arr) then
            table.insert(filtered, v)
        end
    end

    return filtered
end

function M.filterReactDTS(value)
    return string.match(value.targetUri, 'react/index.d.ts') == nil
end

return M
