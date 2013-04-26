Autoconfiguration tool for WPA2 enterprise WiFi for windows vista, windows 7 and windows 8.

the file cert.ml contains a list of CA certificate of the radius server.
If your CA is already known by windows, you can juste leave an empty list.
By default the file contains CAcert (http://www.cacert.org) root and class3
certificate.

The file wifi_xml.ml contains xml wifi profiles for several windows version.
You can juste edit the provided xml for windows vista, windows 7 and
windows 8 with your SSID, cert CN and cert CA. 
However, the easiest way is to configure a wifi profile by hand using windows
interface and to export it with the following command : 
  netsh wlan export profile name="profile_name" folder="C:"

requirement : 
 * Ocaml compiler (the easiest way is installing it via cygwin)
 
Third party optional apps : 
 * mt.exe (Microsoft Manifest Tool) available in the "Microsoft Windows SDK
for Windows 7 and .NET Framework 4", only the "win32 tools" part is needed.
This is require in order to ask the administrator right for the application.
 * A resource editor (optinal) in order to add an icon to the executable. For
this purpose, the last version of Resource Hacker (http://www.angusj.com/resourcehacker/) is provided 
 
 
You may need to edit the PATH variable in make.bat the feet to your
environment.