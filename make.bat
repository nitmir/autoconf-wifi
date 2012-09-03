PATH=%PATH%;C:\cygwin\bin
echo let date="%DATE%" and time="%TIME%";; > date.ml
del Wifi.exe

ocamlopt -c date.ml
ocamlopt -c cert.ml
ocamlopt -c wifi_xml.ml
ocamlopt str.cmxa cert.cmx wifi_xml.cmx date.cmx Wifi.ml -o Wifi.exe

del *.cmi
del *.cmx
del *.o
del date.ml
del Wifi.exe.bak
pause
IsReMan.exe /manifest:Wifi.manifest Wifi.exe

del Wifi.exe.bak
