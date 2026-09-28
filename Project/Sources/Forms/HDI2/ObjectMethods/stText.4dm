Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Contextual click:C713)
			$val:=Dynamic pop up menu:C1006(menu_Hierarchical)
			
			If ($val="revert")
				
				
				If (Get database localization:C1009(Current localization:K5:22)="ja")
					$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLE-ja.json").getText(); Is collection:K8:32)
				Else 
					$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLE-en.json").getText(); Is collection:K8:32)
				End if 
				
				//ALL RECORDS([SAMPLE])
				
				$SAMPLE:=$json.first()
				
				stText:=$SAMPLE.Info
				
				//ALL RECORDS([SAMPLE])
				//stText:=[SAMPLE]Info
				
			Else 
				// all other choices have standard actions ;o)
				
			End if 
			
		End if 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (FORM Get current page:C276=3)
			GetActionInfos
		End if 
		
End case 