-- Main entrypoint
require "config"
require "screen_pointer"
require "traverser"

 first_run = true
local sock = socket.server(DEFAULT_PORT)

while true do 
    
    if first_run == true then
        PrintMenu()
        screen.flip()
        first_run = false
    end

    buttons.read()

    if buttons.triangle then
        sock.close()
        os.exit()
    end
    
    if wlan.isconnected() then 
        local ip_addr = wlan.getip()
        screen.print(15, Screen_pointer, ip_addr, DEFAULT_FONT_SIZE)
        MovePointer()
        local new_conn = socket.accept(sock)
        
        local response = Receive(new_conn, 4096)
        local path = Extract_path(response)

        if path ~= nil and path[-1] == "/" then
            data = Listing(path)
            ctype = "text/html"

            clength = string.len(data)
            resp = Build_response(200, ctype, clength, data)
        else
            filename = path
            http.postfile()
        end

        

    else
        screen.print(15, Screen_pointer, "Not Connected!", DEFAULT_FONT_SIZE)
        MovePointer()
    end


end



