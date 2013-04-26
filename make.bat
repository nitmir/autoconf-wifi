@echo off
PATH=%PATH%;C:\cygwin\bin;C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin
set CYGWIN=nodosfilewarning

echo Building Wifi.exe

echo let date="%DATE%" and time="%TIME%";; > date.ml

ocamlopt -c date.ml
ocamlopt -c cert.ml
ocamlopt -c wifi_xml.ml
ocamlopt str.cmxa cert.cmx wifi_xml.cmx date.cmx Wifi.ml -o Wifi.exe

echo Cleaning
del *.cmi
del *.cmx
del *.o
del date.ml

echo.
echo /!\ We will now try to add a manifest and a    /!\
echo /!\ icon to Wifi.exe by using third party apps /!\
pause
echo.

echo Adding manifest
mt.exe -manifest Wifi.manifest -outputresource:Wifi.exe > NUL

echo Adding icon
ResHacker.exe -addoverwrite "Wifi.exe", "Wifi.exe", "Wifi.ico", ICONGROUP, MAINICON, 0

echo done
pause

del ResHacker.ini
del ResHacker.log
