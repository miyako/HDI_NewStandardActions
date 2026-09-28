//%attributes = {"invisible":true}
C_TEXT:C284($vTimeStamp; $subTime; $ms)
C_TIME:C306($time)
C_LONGINT:C283($ms)

$vTimeStamp:=$1

$subTime:=Substring:C12($vTimeStamp; 12)
$time:=Time:C179($subtime)

$0:=$time
