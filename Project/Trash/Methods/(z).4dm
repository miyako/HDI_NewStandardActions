//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($i; $n)
C_TEXT:C284($text)
$n:=Num:C11($1)
For ($i; 1; $n)
	$text:=$text+String:C10(Random:C100)+"*"
End for 
$text:=Substring:C12($text; 1; Length:C16($text)-1)
