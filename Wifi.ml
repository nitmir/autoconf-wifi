open Cert
open Wifi_xml
open Date


let timef()=
	try
		let i=String.index time ',' in
		let time=String.sub time 0 i in
		time
	with Not_found ->
	time
let time=timef()

let pause()=
	Printf.printf "%s\n" Messages.pause;
	flush_all();
	Scanf.bscanf Scanf.Scanning.stdib "%s" (fun a ->())

let pause_exit int =
	pause();
	exit int

let system_list()=
	let rec aux l=match l with
		| [] -> ()
		| (i,s,_,_)::q -> Printf.printf "	(%d) %s\n" i s;aux q in
	aux wifi_profiles

let valid profile =
	let rec aux l=match l with
		| [] -> false
		| (i,s,_,_)::q when profile=i -> true
		| (i,s,_,_)::q -> aux q in
	aux wifi_profiles

let get_from_version str  =
	let rec aux l = match l with
		| [] -> 0
		| (i,_,s,_)::q when s=str -> i
		| (i,_,s,_)::q -> aux q in
	aux wifi_profiles

let name_from_int int =
	let rec aux l = match l with
		| [] -> ""
		| (i,name,_,_)::q when i=int -> name
		| a::q -> aux q in
	aux wifi_profiles

let run str=
	let tmp_name=Filename.temp_file "tmp" ".txt" in
	let ret =Sys.command (Printf.sprintf "%s > %s" str tmp_name) in
	let tmp=open_in tmp_name in
	let l=ref [] in
	let _ =try
		while true do
			l:=(input_line tmp):: !l
		done
	with End_of_file -> () in
	l:=List.rev !l;
	close_in tmp;
	Sys.remove tmp_name;
	ret,Array.of_list !l

let import_certs()=
	let import_cert str cert success=
		let ca_name,ca=Filename.open_temp_file "root" ".crt" in
		output_string ca str;
		flush_all();
		close_out ca;
		let code,output=run (Printf.sprintf "certutil.exe -addstore %s %s" cert ca_name) in
		let i=Array.length output - 1 in
		if code=0 then begin
			if i>=0 then begin
				Printf.printf "%s\n" success
			end
		end else begin
				for j=0 to i do
					Printf.printf "%s\n" (output.(j))
				done;
				Sys.remove ca_name;
				pause_exit(code)
		end;
		Sys.remove ca_name in

	let rec aux l = match l with
		| [] -> ()
		| (store, comm, cert)::q -> import_cert cert store comm; aux q in
	aux certificates


let install_profile int=
	let install str=
		let delete_profile name =
			let code,output=run (Printf.sprintf "netsh wlan delete profile name=\"%s\"" name) in
				code
		in
		let add_profile str=
			let file_name,file=Filename.open_temp_file "c@ns" ".xml" in
			output_string file str;
			flush_all();
			let out= (Sys.command (Printf.sprintf "netsh wlan add profile filename=\"%s\" user=current" file_name)) in
			close_out file;
			Sys.remove file_name;
			out
		in
		let ret = add_profile str in
		if ret <> 0 then begin
			if delete_profile Config.profile_name = 0 then begin
				Printf.printf "\n%s\n" Messages.profile_deleted;
				add_profile str
			end else ret
		end else ret
	in
	let rec aux l = match l with
		| [] -> failwith Messages.invalid_profil_num
		| (i,_,_,xml)::q when i = int ->  install xml
		| x::q -> aux q in
	aux wifi_profiles

let profile_from_system_version()=
	try
		let ret,output=run "ver" in
		let reg=Str.regexp " " in
		let ver=Array.of_list (Str.split reg output.(1)) in
		let reg=Str.regexp "\\." in
		let ver=Array.of_list (Str.split reg ver.(3)) in
		let ver=(ver.(0) ^"."^ ver.(1) ) in
		get_from_version ver
	with _ -> (-1)

let configure profile =
	Printf.printf "%s %s.\n" Messages.configuring_profile_for (name_from_int profile);
	import_certs();
	print_newline();
	install_profile profile

let rec retrive_profile profile =
	if valid profile then profile
	else begin
		if profile = 0 then exit(0);
		Printf.printf "%s" Messages.get_profile_number;
		flush_all();
		try Scanf.bscanf Scanf.Scanning.stdib "%s\n" (fun a ->retrive_profile (int_of_string a))
		with Failure("int_of_string") ->retrive_profile profile
	end

let main() =
	Sys.catch_break true;
	try
		Messages.date_and_time date time;
		let profile = profile_from_system_version() in
		if valid profile then configure profile
		else begin
			Printf.printf "%s\n" Messages.system_list;
			system_list();
			let profile = retrive_profile profile in
			configure profile
		end
	with Sys.Break -> print_newline(); exit(0)

let _ = pause_exit (main())
