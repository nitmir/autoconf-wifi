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

(* list of (int, name, version, xml) where :
  * int is the number of the profile
  * name is a string displayed to the user
  * version is the two first digit of the windows version returned vy "ver"
  * xml is a xml wifi profile
*)
open Config

let genere_profil_xml
	?allow_prompt_when_ca_not_found:(allow_prompt_when_ca_not_found=None)
	?fips:(fips=None)
	?cache_pmk:(cache_pmk=None)
	?cache_user_data:(cache_user_data=None)
	?auth_mode:(auth_mode=None)

	~profile_name:profile_name
	~ssid_name:ssid_name
	~user_prompt_for_server_validation:user_prompt_for_server_validation
	~server_name:server_name
	~root_ca:root_ca
	~fast_reconnect:fast_reconnect
	~enable_quarantine_checks:enable_quarantine_checks
	~require_crypto_binding:require_crypto_binding
	~perform_server_validation:perform_server_validation
	~accept_server_name:accept_server_name
	~eap_method_type:eap_method_type

	()

	=

	let rec string_to_hex str =
		let len = String.length str in
		if len = 0 then ""
		else
			(Printf.sprintf "%X" (Char.code(str.[0]))) ^ string_to_hex (String.sub str 1 (len -1))
	in

"<?xml version=\"1.0\"?>
<WLANProfile xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v1\">
	<name>" ^ profile_name ^"</name>
	<SSIDConfig>
		<SSID>
			<hex>" ^ (string_to_hex  ssid_name) ^ "</hex>
			<name>" ^ ssid_name ^ "</name>
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
				<useOneX>true</useOneX>" ^ (match fips with
					| None -> "\n"
					| Some bool -> "\n<FIPSMode xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v2\">" ^ (if bool then "true" else "false") ^ "</FIPSMode>\n") ^
			"</authEncryption>" ^ (match cache_pmk with
				| None -> "\n"
				| Some bool -> "\n<PMKCacheMode>" ^ (if bool then "enabled" else "disabled") ^ "</PMKCacheMode>\n") ^
			"<OneX xmlns=\"http://www.microsoft.com/networking/OneX/v1\">" ^ (match cache_user_data with
				| None -> "\n"
				| Some bool -> "\n<cacheUserData>"^(if bool then "true" else "false")^"</cacheUserData>\n") ^ (match auth_mode with
				| None -> "\n"
				| Some data -> "\n<authMode>" ^ data ^ "</authMode>\n") ^
				"<EAPConfig>
					<EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
						<EapMethod>
							<Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">" ^ eap_method_type ^ "</Type>
							<VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId>
							<VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType>
							<AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId>
						</EapMethod>
						<Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
							<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
								<Type>" ^ eap_method_type ^ "</Type>
								<EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\">
									<ServerValidation>
										<DisableUserPromptForServerValidation>" ^ (if user_prompt_for_server_validation then "false" else "true") ^ "</DisableUserPromptForServerValidation>
										<ServerNames>" ^ server_name ^ "</ServerNames>
										<TrustedRootCA>" ^ root_ca ^ "</TrustedRootCA>
									</ServerValidation>
									<FastReconnect>" ^ (if fast_reconnect then "true" else "false") ^ "</FastReconnect>
									<InnerEapOptional>false</InnerEapOptional>
									<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
										<Type>26</Type>
										<EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\">
											<UseWinLogonCredentials>false</UseWinLogonCredentials>
										</EapType>
									</Eap>
									<EnableQuarantineChecks>" ^ (if enable_quarantine_checks then "true" else "false") ^"</EnableQuarantineChecks>
									<RequireCryptoBinding>" ^ (if require_crypto_binding then "true" else "false" ) ^ "</RequireCryptoBinding>
									<PeapExtensions>
										<PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">" ^ (if perform_server_validation then "true" else "false") ^ "</PerformServerValidation>
										<AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">" ^ (if accept_server_name then "true" else "false") ^ "</AcceptServerName>" ^
										(match allow_prompt_when_ca_not_found with
											| None -> "\n"
											| Some bool ->
										"<PeapExtensionsV2 xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">
											<AllowPromptingWhenServerCANotFound xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV3\">" ^ (if bool then "true" else "false") ^ "</AllowPromptingWhenServerCANotFound> 
										</PeapExtensionsV2>") ^
									 "</PeapExtensions>
								</EapType>
							</Eap>
						</Config>
					</EapHostConfig>
				</EAPConfig>
			</OneX>
		</security>
	</MSM>
</WLANProfile>
"


let wifi_profiles = [
(* Windows Vista profile *)
(1, "Windows Vista", "6.0", genere_profil_xml
	~profile_name:profile_name
	~ssid_name:ssid_name
	~user_prompt_for_server_validation:user_prompt_for_server_validation
	~server_name:server_name
	~root_ca:root_ca
	~fast_reconnect:fast_reconnect
	~enable_quarantine_checks:enable_quarantine_checks
	~require_crypto_binding:require_crypto_binding
	~perform_server_validation:perform_server_validation
	~accept_server_name:accept_server_name
	~eap_method_type:eap_method_type
	());

(* Windows 7 profile *)
(2, "Windows 7", "6.1",genere_profil_xml
	~profile_name:profile_name
	~ssid_name:ssid_name
	~user_prompt_for_server_validation:user_prompt_for_server_validation
	~server_name:server_name
	~root_ca:root_ca
	~fast_reconnect:fast_reconnect
	~enable_quarantine_checks:enable_quarantine_checks
	~require_crypto_binding:require_crypto_binding
	~perform_server_validation:perform_server_validation
	~accept_server_name:accept_server_name
	~eap_method_type:eap_method_type

	~fips:(Some fips)
	~cache_pmk:(Some cache_pmk)
	~cache_user_data:(Some cache_user_data)
	~auth_mode:(Some auth_mode)
	());

(* Windows 8 profile *)
(3, "Windows 8", "6.2",genere_profil_xml
	~profile_name:profile_name
	~ssid_name:ssid_name
	~user_prompt_for_server_validation:user_prompt_for_server_validation
	~server_name:server_name
	~root_ca:root_ca
	~fast_reconnect:fast_reconnect
	~enable_quarantine_checks:enable_quarantine_checks
	~require_crypto_binding:require_crypto_binding
	~perform_server_validation:perform_server_validation
	~accept_server_name:accept_server_name
	~eap_method_type:eap_method_type

	~fips:(Some fips)
	~cache_pmk:(Some cache_pmk)
	~cache_user_data:(Some cache_user_data)
	~auth_mode:(Some auth_mode)

	~allow_prompt_when_ca_not_found:(Some allow_prompt_when_ca_not_found)
	());

]
