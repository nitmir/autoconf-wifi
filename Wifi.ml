

let version = [(1,"Windows Vista","6.0");(2,"WIndows 7","6.1")];;
let current = ref 0;;
let list()=
	let rec aux l=match l with
		| [] -> ()
		| (i,s,_)::q -> Printf.printf "	(%d) %s\n" i s;aux q in
	aux version;;
let valid()=
	let rec aux l=match l with
		| [] -> false
		| (i,s,_)::q when !current=i -> true
		| (i,s,_)::q -> aux q in
	aux version;;
let get_from_version str  = 
	let rec aux l = match l with
		| [] -> 0
		| (i,_,s)::q when s=str -> i
		| (i,_,s)::q -> aux q in
	aux version;;


let cacert="-----BEGIN CERTIFICATE-----
MIIHPTCCBSWgAwIBAgIBADANBgkqhkiG9w0BAQQFADB5MRAwDgYDVQQKEwdSb290
IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNB
IENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRA
Y2FjZXJ0Lm9yZzAeFw0wMzAzMzAxMjI5NDlaFw0zMzAzMjkxMjI5NDlaMHkxEDAO
BgNVBAoTB1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0Lm9yZzEi
MCAGA1UEAxMZQ0EgQ2VydCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJ
ARYSc3VwcG9ydEBjYWNlcnQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAziLA4kZ97DYoB1CW8qAzQIxL8TtmPzHlawI229Z89vGIj053NgVBlfkJ
8BLPRoZzYLdufujAWGSuzbCtRRcMY/pnCujW0r8+55jE8Ez64AO7NV1sId6eINm6
zWYyN3L69wj1x81YyY7nDl7qPv4coRQKFWyGhFtkZip6qUtTefWIonvuLwphK42y
fk1WpRPs6tqSnqxEQR5YYGUFZvjARL3LlPdCfgv3ZWiYUQXw8wWRBB0bF4LsyFe7
w2t6iPGwcswlWyCR7BYCEo8y6RcYSNDHBS4CMEK4JZwFaz+qOqfrU0j36NK2B5jc
G8Y0f3/JHIJ6BVgrCFvzOKKrF11myZjXnhCLotLddJr3cQxyYN/Nb5gznZY0dj4k
epKwDpUeb+agRThHqtdB7Uq3EvbXG4OKDy7YCbZZ16oE/9KTfWgu3YtLq1i6L43q
laegw1SJpfvbi1EinbLDvhG+LJGGi5Z4rSDTii8aP8bQUWWHIbEZAWV/RRyH9XzQ
QUxPKZgh/TMfdQwEUfoZd9vUFBzugcMd9Zi3aQaRIt0AUMyBMawSB3s42mhb5ivU
fslfrejrckzzAeVLIL+aplfKkQABi6F1ITe1Yw1nPkZPcCBnzsXWWdsC4PDSy826
YreQQejdIOQpvGQpQsgi3Hia/0PsmBsJUUtaWsJx8cTLc6nloQsCAwEAAaOCAc4w
ggHKMB0GA1UdDgQWBBQWtTIb1Mfz4OaO873SsDrusjkY0TCBowYDVR0jBIGbMIGY
gBQWtTIb1Mfz4OaO873SsDrusjkY0aF9pHsweTEQMA4GA1UEChMHUm9vdCBDQTEe
MBwGA1UECxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0
IFNpZ25pbmcgQXV0aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2Vy
dC5vcmeCAQAwDwYDVR0TAQH/BAUwAwEB/zAyBgNVHR8EKzApMCegJaAjhiFodHRw
czovL3d3dy5jYWNlcnQub3JnL3Jldm9rZS5jcmwwMAYJYIZIAYb4QgEEBCMWIWh0
dHBzOi8vd3d3LmNhY2VydC5vcmcvcmV2b2tlLmNybDA0BglghkgBhvhCAQgEJxYl
aHR0cDovL3d3dy5jYWNlcnQub3JnL2luZGV4LnBocD9pZD0xMDBWBglghkgBhvhC
AQ0ESRZHVG8gZ2V0IHlvdXIgb3duIGNlcnRpZmljYXRlIGZvciBGUkVFIGhlYWQg
b3ZlciB0byBodHRwOi8vd3d3LmNhY2VydC5vcmcwDQYJKoZIhvcNAQEEBQADggIB
ACjH7pyCArpcgBLKNQodgW+JapnM8mgPf6fhjViVPr3yBsOQWqy1YPaZQwGjiHCc
nWKdpIevZ1gNMDY75q1I08t0AoZxPuIrA2jxNGJARjtT6ij0rPtmlVOKTV39O9lg
18p5aTuxZZKmxoGCXJzN600BiqXfEVWqFcofN8CCmHBh22p8lqOOLlQ+TyGpkO/c
gr/c6EWtTZBzCDyUZbAEmXZ/4rzCahWqlwQ3JNgelE5tDlG+1sSPypZt90Pf6DBl
Jzt7u0NDY8RD97LsaMzhGY4i+5jhe1o+ATc7iwiwovOVThrLm82asduycPAtStvY
sONvRUgzEv/+PDIqVPfE94rwiCPCR/5kenHA0R6mY7AHfqQv0wGP3J8rtsYIqQ+T
SCX8Ev2fQtzzxD72V7DX3WnRBnc0CkvSyqD/HMaMyRa+xMwyN2hzXwj7UfdJUzYF
CpUCTPJ5GhD22Dp1nPMd8aINcGeGG7MW9S/lpOt5hvk9C8JzC6WZrG/8Z7jlLwum
GCSNe9FINSkYQKyTYOGWhlC0elnYjyELn8+CkcY7v2vcB5G5l1YjqrZslMZIBjzk
zk6q5PYvCdxTby78dOs6Y5nCpqyJvKeyRKANihDjbPIky/qbn3BHLt4Ui9SyIAmW
omTxJBzcoTWcFbLUvFUufQb1nA5V9FrWk9p2rSVzTMVD
-----END CERTIFICATE-----
";;

let seven_xml="<?xml version=\"1.0\"?>
<WLANProfile xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v1\">
	<name>Cr@ns</name>
	<SSIDConfig>
		<SSID>
			<hex>4372406E73</hex>
			<name>Cr@ns</name>
		</SSID>
		<nonBroadcast>false</nonBroadcast>
	</SSIDConfig>
	<connectionType>ESS</connectionType>
	<connectionMode>auto</connectionMode>
	<autoSwitch>false</autoSwitch>
	<MSM>
		<security>
			<authEncryption>
				<authentication>WPA2</authentication>
				<encryption>AES</encryption>
				<useOneX>true</useOneX>
				<FIPSMode xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v2\">false</FIPSMode>
			</authEncryption>
			<PMKCacheMode>disabled</PMKCacheMode>
			<OneX xmlns=\"http://www.microsoft.com/networking/OneX/v1\">
				<cacheUserData>true</cacheUserData>
				<authMode>user</authMode>
				<EAPConfig><EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\"><EapMethod><Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">25</Type><VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId><VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType><AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId></EapMethod><Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\"><Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\"><Type>25</Type><EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\"><ServerValidation><DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation><ServerNames>wifi.crans.org</ServerNames><TrustedRootCA>13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 </TrustedRootCA></ServerValidation><FastReconnect>false</FastReconnect><InnerEapOptional>false</InnerEapOptional><Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\"><Type>26</Type><EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\"><UseWinLogonCredentials>false</UseWinLogonCredentials></EapType></Eap><EnableQuarantineChecks>false</EnableQuarantineChecks><RequireCryptoBinding>false</RequireCryptoBinding><PeapExtensions><PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</PerformServerValidation><AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</AcceptServerName></PeapExtensions></EapType></Eap></Config></EapHostConfig></EAPConfig>
			</OneX>
		</security>
	</MSM>
</WLANProfile>
";;

let vista_xml="<?xml version=\"1.0\"?>
<WLANProfile xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v1\">
	<name>Cr@ns</name>
	<SSIDConfig>
		<SSID>
			<hex>4372406E73</hex>
			<name>Cr@ns</name>
		</SSID>
		<nonBroadcast>false</nonBroadcast>
	</SSIDConfig>
	<connectionType>ESS</connectionType>
	<connectionMode>auto</connectionMode>
	<autoSwitch>false</autoSwitch>
	<MSM>
		<security>
			<authEncryption>
				<authentication>WPA2</authentication>
				<encryption>AES</encryption>
				<useOneX>true</useOneX>
			</authEncryption>
			<OneX xmlns=\"http://www.microsoft.com/networking/OneX/v1\">
				<EAPConfig><EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\"><EapMethod><Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">25</Type><VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId><VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType><AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId></EapMethod><Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\"><Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\"><Type>25</Type><EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\"><ServerValidation><DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation><ServerNames>wifi.crans.org</ServerNames><TrustedRootCA>13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 </TrustedRootCA></ServerValidation><FastReconnect>false</FastReconnect><InnerEapOptional>false</InnerEapOptional><Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\"><Type>26</Type><EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\"><UseWinLogonCredentials>false</UseWinLogonCredentials></EapType></Eap><EnableQuarantineChecks>false</EnableQuarantineChecks><RequireCryptoBinding>false</RequireCryptoBinding><PeapExtensions><PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</PerformServerValidation><AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</AcceptServerName></PeapExtensions></EapType></Eap></Config></EapHostConfig></EAPConfig>
			</OneX>
		</security>
	</MSM>
</WLANProfile>
";;

let run str=
	let tmp_name=Filename.temp_file "tmp" ".txt" in
	let ret =Sys.command (Printf.sprintf "%s > %s" str tmp_name) in
	let tmp=open_in tmp_name in
	let l=ref [] in
	let _ =try
		while true do
			l:=(input_line tmp):: !l;
		done
	with End_of_file -> () in
	l:=List.rev !l;
	(*let output=String.concat "" !l in*)
	close_in tmp;
	Sys.remove tmp_name;
	ret,Array.of_list !l;;


let ret=ref 0;;
let import_cert()=
let ca_name,ca=Filename.open_temp_file "root" ".crt" in
output_string ca cacert;
flush_all();
close_out ca;
ret:= (Sys.command (Printf.sprintf "certutil.exe -addstore root %s | tail -n 1" ca_name));
Sys.remove ca_name;;


let fun1()=
let file_name,file=Filename.open_temp_file "c@ns" ".xml" in
output_string file vista_xml;
flush_all();
ret:= (Sys.command (Printf.sprintf "netsh wlan add profile filename=\"%s\" user=current" file_name));
close_out file;
Sys.remove file_name;;


let fun2()=
let file_name,file=Filename.open_temp_file "c@ns" ".xml" in
output_string file seven_xml;
flush_all();
ret:= (Sys.command (Printf.sprintf "netsh wlan add profile filename=\"%s\" user=current" file_name));
close_out file;
Sys.remove file_name;;


let pause()=
Printf.printf "Appuyer sur une touche pour continuer\n";
flush_all();
Scanf.bscanf Scanf.Scanning.stdib "%s" (fun a ->());;

let rec print_l l= match l with
	|[]->()
	|s::q -> print_string (s^"\n");print_l q;;

let version()=
	try 
		let ret,output=run "ver" in
		let reg=Str.regexp " " in
		let ver=Array.of_list (Str.split reg output.(1)) in
		let reg=Str.regexp "\\." in
		let ver=Array.of_list (Str.split reg ver.(3)) in
		let ver=(ver.(0) ^"."^ ver.(1) ) in
		get_from_version ver;
	with _ -> 0;;
	
	
(*let _ = GMain.init ()

(* Fenêtre principale de l'application. *)
let window = GWindow.window 
  ~title:"Wifi" 
  ~height:100 
  ~width:300 ()

(* Bouton qui souhaite le bonjour à l'utilisateur. *)
let say_hello = GButton.button
  ~label:"CaCert"
  ~packing:window#add ()


let _ =
  window#connect#destroy ~callback:GMain.quit;
  say_hello#connect#clicked ~callback:import_cert;
  window#show ();
  GMain.main ()*)
current:=version();;
while not (valid()) do
	Printf.printf "Liste des sytŠmes support‚s\n";
	list();
	Printf.printf "%s" "Entrez un num‚ro et validez : ";
	flush_all();
	try
		Scanf.bscanf Scanf.Scanning.stdib "%s\n" (fun a ->current:=int_of_string a);
	with Failure("int_of_string") ->();
done;;
import_cert();;
(*Printf.printf "%s\n" file_name;;*)
if !current = 1 then begin
fun1();
end;
if !current = 2 then begin
fun2();
end;
pause();;
