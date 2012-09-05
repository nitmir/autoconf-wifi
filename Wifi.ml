open Cert
open Wifi_xml
open Date


let timef()=
	try
		let i=String.index time ',' in
		let time=String.sub time 0 i in
		time;
	with Not_found -> 
	time;;
let time=timef();;
let version = [
	(1,"Windows Vista","6.0");
	(2,"Windows 7","6.1");
	(*(3,"Windows 8","6.2")*)
	];;

let pause()=
	Printf.printf "Appuyer sur une touche pour continuer\n";
	flush_all();
	Scanf.bscanf Scanf.Scanning.stdib "%s" (fun a ->());;

let exit int = pause(); exit int;;

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
	
let name_from_int int = 
	let rec aux l = match l with
		| [] -> ""
		| (i,name,_)::q when i=int -> name
		| a::q -> aux q in
	aux version;;

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
	close_in tmp;
	Sys.remove tmp_name;
	ret,Array.of_list !l;;


let ret=ref 0;;
let import_cert str cert success=
	let ca_name,ca=Filename.open_temp_file "root" ".crt" in
	output_string ca str;
	flush_all();
	close_out ca;
	let code,output=run (Printf.sprintf "certutil.exe -addstore %s %s" cert ca_name) in
	let i=Array.length output - 1 in
	if code=0 then begin
		if i>=0 then begin
			print_string (success);
			print_newline();
		end
	end else begin
			for j=0 to i do
				print_string (output.(j));
				print_newline();
			done;
			Sys.remove ca_name;
			exit(code);
	end;
	Sys.remove ca_name;;

let delete_profile name =
	let code,output=run (Printf.sprintf "netsh wlan delete profile name=\"%s\"" name) in
		code;;

let add_profile str=
	let file_name,file=Filename.open_temp_file "c@ns" ".xml" in
	output_string file str;
	flush_all();
	let out= (Sys.command (Printf.sprintf "netsh wlan add profile filename=\"%s\" user=current" file_name)) in
	close_out file;
	Sys.remove file_name;
	ret:=out;
	out;;
	
let install str=
	if add_profile str <> 0 then begin
		if delete_profile "Cr@ns" = 0 then begin
			print_newline();
			Printf.printf "Supression du profil r‚ussie.\n";
			ignore (add_profile str);
		end
	end;;

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
	
	
current:=version();;
Printf.printf "Cr‚‚ le %s … %s\n" date time;;
while not (valid()) do
	Printf.printf "Liste des sytŠmes support‚s\n";
	list();
	Printf.printf "%s" "Entrez un num‚ro et validez : ";
	flush_all();
	try
		Scanf.bscanf Scanf.Scanning.stdib "%s\n" (fun a ->current:=int_of_string a);
	with Failure("int_of_string") ->();
done;;
Printf.printf "Configuration pour %s.\n" (name_from_int !current);;
import_cert cacert "root" "Certificat racine import‚.";;
import_cert class3 "CA" "Certificat interm‚diaire import‚.";;
print_newline();;
if !current = 1 then install vista_xml;
if !current = 2 then install seven_xml;
if !current = 3 then install heigth_xml;

exit(!ret);;
