require "config"


Screen_pointer = 15

function MovePointer()

    Screen_pointer = Screen_pointer + TEXT_OFFSET
end

function ResetPointer()
    Screen_pointer = INITIAL_POINTER_POS
    screen.flip()
end

function PrintMenu()

    screen.print(15, Screen_pointer, "Welcome to PSPFTP, the LUA FTP server for your PSP", DEFAULT_FONT_SIZE)
    MovePointer()
    screen.print(15, Screen_pointer, "Press triangle to exit.", DEFAULT_FONT_SIZE)
    MovePointer()
end
