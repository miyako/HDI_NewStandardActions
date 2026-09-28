//%attributes = {"invisible":true}
$n:=Size of array:C274(_Actions)

For ($i; 1; $n)
	$info:=Action info:C1442(_Actions{$i})
	
	_LocalTitle{$i}:=OB Get:C1224($info; "title"; Is text:K8:3)
	_Status{$i}:=OB Get:C1224($info; "status"; Is text:K8:3)
	_Enabled{$i}:=OB Get:C1224($info; "enabled"; Is boolean:K8:9)
	_Visible{$i}:=OB Get:C1224($info; "visible"; Is boolean:K8:9)
	
End for 
