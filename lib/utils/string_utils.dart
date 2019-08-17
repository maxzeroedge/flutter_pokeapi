
String capitalizeString(String str){
	str = str.replaceAll("-", " ");
	return str.split(" ").map( (s) => '${s[0].toUpperCase()}${s.substring(1)}' ).join(" ");
}