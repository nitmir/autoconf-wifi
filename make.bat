del Wifi.exe

ocamlopt unix.cmxa str.cmxa Wifi.ml -o Wifi.exe
REM ~ ocamlopt -I +site-lib/lablgtk2 lablgtk.cmxa unix.cmxa str.cmxa Wifi.ml -o Wifi.exe

del Wifi.cmi
del Wifi.cmx
del Wifi.o
del Wifi.exe.bak
sleep 2
IsReMan.exe /manifest:Wifi.manifest Wifi.exe

del Wifi.exe.bak
