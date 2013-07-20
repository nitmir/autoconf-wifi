(*************************************************************************************)
(* This program is distributed in the hope that it will be useful, but WITHOUT       *)
(* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS     *)
(* FOR A PARTICULAR PURPOSE.  See the GNU General Public License version 2 for       *)
(* more details.                                                                     *)
(*                                                                                   *)
(* You should have received a copy of the GNU General Public License version 2       *)
(* along with this program; if not, write to the Free Software Foundation, Inc., 51  *)
(* Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                          *)
(*************************************************************************************)

(*************************************************************************************)
(* The following paramters, appart for server validation, match to this tutorial :   *)
(* https://wifi.crans.org/WiFi/SousWindowsVista/EnglishVersion                       *)
(*************************************************************************************)

(* Options *)

(*************************************************************************************)
(* Name of the windows profile in the wifi interface. Please edit also the file      *)
(* Wifi.manist to feet to this description and change the file Wifi.ico.             *)
(*************************************************************************************)
let profile_name = "Cr@ns"

(* Name of the SSID *)
let ssid_name = "Cr@ns"

(* 25 for PEAP, see http://www.iana.org/assignments/eap-numbers/eap-numbers.xhtml *)
let eap_method_type = 25

(* Should be always be let to true and CA and CN properly setup *)
let perform_server_validation = true

(*************************************************************************************)
(* Indicates whether the server name is validated against the name string specified  *)
(* in the ServerNames                                                                *)
(*************************************************************************************)
let accept_server_name = true

(*************************************************************************************)
(* If user_prompt_for_server_validation is FALSE, then EAP-TLS performs the server   *)
(* validation without user input; if the validation fails, EAP-TLS fails             *)
(* the authentication. If user_prompt_for_server_validation is TRUE, the user is     *)
(* prompted for a validated server certificate or name, or root certificate          *)
(* authority (CA).                                                                   *)
(*************************************************************************************)
let user_prompt_for_server_validation = true

(* CN of the radius certificate *)
let server_name = "wifi.crans.org"

(* SHA1 Fingerprint for the root CA, the trailling space matter *)
let root_ca = "13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 "

(*************************************************************************************)
(* fast reconnect, which reduces the delay in time between an authentication request *)
(* by a client and the response by the IAS or RADIUS server, and allows wireless     *)
(* clients to move between access points without repeated requests for               *)
(* authentication.                                                                   *)
(*************************************************************************************)
let fast_reconnect = false

(*************************************************************************************)
(* indicates whether to perform Network Access Protection (NAP) checks. If the       *)
(* enable_quarantine_checks element is TRUE, then PEAP will perform NAP checks;      *)
(* if FALSE, PEAP will not perform NAP checks.                                       *)
(*************************************************************************************)
let enable_quarantine_checks = false

(*************************************************************************************)
(* indicates whether to authenticate with servers that support cryptobinding.        *)
(* Beware : If the RequireCryptoBinding element is TRUE, then PEAP will authenticate *)
(* with servers that don't support cryptobinding; if FALSE, then PEAP will only      *)
(* authenticate with servers that support cryptobinding.                             *)
(*************************************************************************************)
let require_crypto_binding = false




(* Windows 7 and 8 options *)

(*************************************************************************************)
(* The fips (authEncryption) element indicates whether Federal Information           *)
(* Processing Standards (FIPS) mode is enabled. When a wireless connection is        *)
(* operating in FIPS mode, the security level of the connection complies with        *)
(* the FIPS 140-2 standard.                                                          *)
(*************************************************************************************)
let fips = false

(* Indicates whether PMK caching will be used *)
let cache_pmk = false

(* Specifies whether the user credentials are cached for subsequent connections. *)
let cache_user_data = true

(*************************************************************************************)
(* The authMode (OneX) element specifies the type of credentials used for            *)
(* authentication. The following table describes the possible values.                *)
(* - machine                                           Use machine credentials only. *)
(* - user                                                 Use user credentials only. *)
(* - guest                                       Use guest (empty) credentials only. *)
(* - machineOrUser         Use machine or user credentials. When a user is logged on *)
(*                         the user's credentials are used for authentication.       *)
(*                         When no user is logged on, machine credentials are used.  *)
(*************************************************************************************)
let auth_mode = "user"



(* Windows 8 options *)
let allow_prompt_when_ca_not_found = true
