PATH=%PATH%;C:\cygwin\bin
del Wifi.exe

ocamlopt -c cert.ml
ocamlopt -c wifi_xml.ml
ocamlopt str.cmxa cert.cmx wifi_xml.cmx Wifi.ml -o Wifi.exe

del *.cmi
del *.cmx
del *.o
del Wifi.exe.bak
pause
IsReMan.exe /manifest:Wifi.manifest Wifi.exe

del Wifi.exe.bak
