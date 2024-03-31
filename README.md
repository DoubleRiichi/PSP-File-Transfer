# PSP-File-Transfer
[WIP] A File Transfer server for the PSP Game Console, written in Lua and running on the OneLua interpreter

## SCRIPT.LUA is the main entry point of this program

Unfortunately ONELUA doesn't expose any function to read a file as binary, serving the requested files using raw sockets is probably impossible (booh). However, there's an http.postfile() function to send a file as an http post request... It's ugly and weird but it will do. 

Currently debugging the program using the PPSSPP emulator, unfortunately ONELUA network function doesn't seem to be working, and while I have a PSP with me I can't connect it to internet: new encryption doesn't seem to be supported. 

