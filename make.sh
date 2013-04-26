#!/bin/bash
echo "Building Wifi.exe"

echo "let date=\"`date '+%d/%m/%Y'`\" and time=\"`date '+%H:%M:%S,00'`\";;" > date.ml

i686-w64-mingw32-windres -o resources.o Wifi.rc
i686-w64-mingw32-ocamlopt -c date.ml
i686-w64-mingw32-ocamlopt -c cert.ml
i686-w64-mingw32-ocamlopt -c wifi_xml.ml
i686-w64-mingw32-ocamlopt resources.o str.cmxa cert.cmx wifi_xml.cmx date.cmx Wifi.ml -o Wifi.exe

echo "Cleaning"
rm *.cmi *.cmx *.o date.ml

echo done

