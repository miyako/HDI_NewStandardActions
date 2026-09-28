//%attributes = {"invisible":true}
C_TEXT:C284($vTimeStamp; $subTime; $ms)
C_TIME:C306($time)
C_LONGINT:C283($ms)

$vTimeStamp:=$1

$subTime:=Substring:C12($vTimeStamp; 12)
$time:=Time:C179($subtime)
$subTime:=Substring:C12($subtime; 10; 3)
$ms:=Num:C11($subTime)


$2:=$time
$3:=$ms
