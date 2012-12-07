
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
				<EAPConfig>
					<EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
						<EapMethod>
							<Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">25</Type>
							<VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId>
							<VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType>
							<AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId>
						</EapMethod>
						<Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
							<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
								<Type>25</Type>
								<EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\">
									<ServerValidation>
										<DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation>
										<ServerNames>wifi.crans.org</ServerNames>
										<TrustedRootCA>13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 </TrustedRootCA>
									</ServerValidation>
									<FastReconnect>false</FastReconnect>
									<InnerEapOptional>false</InnerEapOptional>
									<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
										<Type>26</Type>
										<EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\">
											<UseWinLogonCredentials>false</UseWinLogonCredentials>
										</EapType>
									</Eap>
									<EnableQuarantineChecks>false</EnableQuarantineChecks>
									<RequireCryptoBinding>false</RequireCryptoBinding>
									<PeapExtensions>
										<PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</PerformServerValidation>
										<AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</AcceptServerName>
									</PeapExtensions>
								</EapType>
							</Eap>
						</Config>
					</EapHostConfig>
				</EAPConfig>
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
				<EAPConfig>
					<EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
						<EapMethod>
							<Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">25</Type>
							<VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId>
							<VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType>
							<AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId>
						</EapMethod>
						<Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
							<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
								<Type>25</Type>
								<EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\">
									<ServerValidation>
										<DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation>
										<ServerNames>wifi.crans.org</ServerNames>
										<TrustedRootCA>13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 </TrustedRootCA>
									</ServerValidation>
									<FastReconnect>false</FastReconnect>
									<InnerEapOptional>false</InnerEapOptional>
									<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
										<Type>26</Type>
										<EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\">
											<UseWinLogonCredentials>false</UseWinLogonCredentials>
										</EapType>
									</Eap>
									<EnableQuarantineChecks>false</EnableQuarantineChecks>
									<RequireCryptoBinding>false</RequireCryptoBinding>
									<PeapExtensions>
										<PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</PerformServerValidation>
										<AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</AcceptServerName>
									</PeapExtensions>
								</EapType>
							</Eap>
						</Config>
					</EapHostConfig>
				</EAPConfig>
			</OneX>
		</security>
	</MSM>
</WLANProfile>
";;


let heigth_xml="<?xml version=\"1.0\"?>
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
				<EAPConfig>
					<EapHostConfig xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
						<EapMethod>
							<Type xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">25</Type>
							<VendorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorId>
							<VendorType xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</VendorType>
							<AuthorId xmlns=\"http://www.microsoft.com/provisioning/EapCommon\">0</AuthorId>
						</EapMethod>
						<Config xmlns=\"http://www.microsoft.com/provisioning/EapHostConfig\">
							<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
								<Type>25</Type>
								<EapType xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1\">
									<ServerValidation>
										<DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation>
										<ServerNames>wifi.crans.org</ServerNames>
										<TrustedRootCA>13 5c ec 36 f4 9c b8 e9 3b 1a b2 70 cd 80 88 46 76 ce 8f 33 </TrustedRootCA>
									</ServerValidation>
									<FastReconnect>false</FastReconnect>
									<InnerEapOptional>false</InnerEapOptional>
									<Eap xmlns=\"http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1\">
										<Type>26</Type>
										<EapType xmlns=\"http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1\">
											<UseWinLogonCredentials>false</UseWinLogonCredentials>
										</EapType>
									</Eap>
									<EnableQuarantineChecks>false</EnableQuarantineChecks>
									<RequireCryptoBinding>false</RequireCryptoBinding>
									<PeapExtensions>
										<PerformServerValidation xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</PerformServerValidation>
										<AcceptServerName xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">true</AcceptServerName>
										<PeapExtensionsV2 xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2\">
											<AllowPromptingWhenServerCANotFound xmlns=\"http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV3\">true</AllowPromptingWhenServerCANotFound> 
										</PeapExtensionsV2>
									</PeapExtensions>
								</EapType>
							</Eap>
						</Config>
					</EapHostConfig>
				</EAPConfig>
			</OneX>
		</security>
	</MSM>
</WLANProfile>
";;