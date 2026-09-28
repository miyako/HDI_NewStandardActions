//%attributes = {}

If (Get database localization:C1009(Current localization:K5:22)="ja")
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("InitTable-ja.json").getText(); Is collection:K8:32)
Else 
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("InitTable-en.json").getText(); Is collection:K8:32)
End if 

$InitTable:=$json.first()

//ALL RECORDS([InitTable])
vTextInfo:=$InitTable.textInfo