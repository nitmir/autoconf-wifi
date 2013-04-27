(* Options *)
let profile_name = "Cr@ns"
let ssid_name = "Cr@ns"
let user_prompt_for_server_validation = true
(* CN of the radius certificate *)
let server_name = "wifi.crans.org"
(* SHA1 Fingerprint for the root CA *)
let root_ca = "13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 " (* the trailling space matter *)
let fast_reconnect = false

(* Windows 7 and 8 options *)
let fips = false
let cache_pmk = false
let cache_user_data = true
let auth_mode = "user"

(* Windows 8 options *)
let allow_prompt_when_ca_not_found = true
