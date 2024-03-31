function cd(path)

    local files_list = files.list(path)

    if files_list then
        return files_list
    else
        return nil
    end
end

function Listing(path)
    local dir_list = cd(path)
  
    if dir_list == nil then
        return nil
    end

    local payload = ""

    payload = payload .. "<ul>"

    for _, item in pairs(dir_list) do
        local modifier = ""

        if item["directory"] then
            modifier = "/"
        end

        payload = payload .. "<li><a href='./" .. item["name"]
                  .. modifier .. "'>" .. item["name"] .. modifier
                  .. "</a></li>"
    end

    payload = payload .. "</ul><br><a href='./../'>Return</a>   <a href='/'>Home</a>"
    return payload
end