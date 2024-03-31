require "config"

function StartSocket(port)
    
end


function Receive(socket, size)

    local content

    while true do
        local chunk = socket.recv(socket, size)

        if string.len(chunk) == 0 then
            break
        end

        content = content .. chunk
    end

    return content
end


function  Extract_path(header)
    local begin = string.find(header, "/")
    local s_end = string.find(header, " ", begin)
    
    if begin and s_end then
        return string.sub(header, begin, s_end)
    end 

    return nil
end


function Build_response(code, ctype, clength, payload)
    local header = "HTTP/1.1 " .. code .. "\r\n"   .. 
             "Content-Type: " .. ctype .. "\r\n"  ..
             "Content-Length: " .. clength .. "\r\n" ..
             "Connection: close\r\n\r\n"

    return header .. payload

end