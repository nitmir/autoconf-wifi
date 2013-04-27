Autoconfiguration tool for WPA2 enterprise WiFi for windows vista, windows 7
and windows 8.

the file cert.ml contains a list of CA certificates used by the radius server.
If your CA is already known by windows, you can juste leave an empty list.
By default the file contains CAcert (http://www.cacert.org) root and class3
certificate.

The file wifi_xml.ml contains xml wifi profiles for several windows version.
You can juste edit the config.ml variables to feet to your configuration if
juste few changes are needed.
Otherwise, the easiest way is to configure a wifi profile by hand using windows
interface and to export it with the following command :
  netsh wlan export profile name="profile_name" folder="C:"

requirement :
 * Ocaml compiler (via cygwin on windows or mingw-ocaml on debian like systems)
 * mingw resources compiler (via cygwin or mingw-w64-tools on debian like
systems)

You may need to edit the PATH variable in make.bat the feet to your
environment.
