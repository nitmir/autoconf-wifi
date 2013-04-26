@echo off
PATH=%PATH%;C:\cygwin\bin;C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin
set CYGWIN=nodosfilewarning

echo Building Wifi.exe

echo let date="%DATE%" and time="%TIME%";; > date.ml

i686-w64-mingw32-windres -o resources.o resources.rc
ocamlopt -c date.ml
ocamlopt -c cert.ml
ocamlopt -c wifi_xml.ml
ocamlopt resources.o str.cmxa cert.cmx wifi_xml.cmx date.cmx Wifi.ml -o Wifi.exe

echo Cleaning
del *.cmi
del *.cmx
del *.o
del date.ml

pause
