@echo off
PATH=%PATH%;C:\cygwin\bin
set CYGWIN=nodosfilewarning

echo Building Wifi.exe

echo let date="%DATE%" and time="%TIME%";; > date.ml

i686-w64-mingw32-windres -o resources.o Wifi.rc
ocamlopt -c date.ml
ocamlopt -c cert.ml
ocamlopt -c config.ml
ocamlopt -c wifi_xml.ml
ocamlopt -c messages.ml
ocamlopt resources.o str.cmxa cert.cmx config.cmx wifi_xml.cmx date.cmx messages.cmx Wifi.ml -o Wifi.exe

echo Cleaning
del *.cmi
del *.cmx
del *.o
del date.ml

pause
