var stText : Text

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		// init text
		
		If (Get database localization:C1009(Current localization:K5:22)="ja")
			$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLE-ja.json").getText(); Is collection:K8:32)
		Else 
			$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLE-en.json").getText(); Is collection:K8:32)
		End if 
		
		//ALL RECORDS([SAMPLE])
		
		$SAMPLE:=$json.first()
		
		stText:=$SAMPLE.Info
		HIGHLIGHT TEXT:C210(*; "stText"; 0; 1000)
		// end init
		OBJECT SET VISIBLE:C603(*; "stText"; False:C215)
		
		//-------------- define array of actions -------------------
		
		ARRAY TEXT:C222(_Actions; 0)
		
		APPEND TO ARRAY:C911(_Actions; ak font bold:K76:72)
		APPEND TO ARRAY:C911(_Actions; ak font italic:K76:71)
		APPEND TO ARRAY:C911(_Actions; ak font underline:K76:73)
		APPEND TO ARRAY:C911(_Actions; ak font linethrough:K76:74)
		APPEND TO ARRAY:C911(_Actions; ak font show dialog:K76:77)
		APPEND TO ARRAY:C911(_Actions; ak font color dialog:K76:75)
		APPEND TO ARRAY:C911(_Actions; ak background color dialog:K76:76)
		
		APPEND TO ARRAY:C911(_Actions; ak undo:K76:51)
		APPEND TO ARRAY:C911(_Actions; ak redo:K76:52)
		APPEND TO ARRAY:C911(_Actions; ak cut:K76:53)
		APPEND TO ARRAY:C911(_Actions; ak copy:K76:54)
		APPEND TO ARRAY:C911(_Actions; ak paste:K76:55)
		APPEND TO ARRAY:C911(_Actions; ak clear:K76:56)
		APPEND TO ARRAY:C911(_Actions; ak select all:K76:57)
		APPEND TO ARRAY:C911(_Actions; ak show clipboard:K76:58)
		
		APPEND TO ARRAY:C911(_Actions; ak show reference:K76:78)
		APPEND TO ARRAY:C911(_Actions; ak compute expressions:K76:79)
		APPEND TO ARRAY:C911(_Actions; ak freeze expressions:K76:80)
		
		
		// set up UI with localized labels
		
		$n:=Size of array:C274(_Actions)
		For ($i; 1; $n)
			$info:=Action info:C1442(_Actions{$i})
			$title:=OB Get:C1224($info; "title"; Is text:K8:3)
			OBJECT SET TITLE:C194(*; _Actions{$i}; $title)
		End for 
		
		// declare arrays of listbox (page 3)
		
		ARRAY TEXT:C222(_LocalTitle; $n)
		ARRAY TEXT:C222(_Status; $n)
		ARRAY BOOLEAN:C223(_Enabled; $n)
		ARRAY BOOLEAN:C223(_Visible; $n)
		
		//-------------- define menus -------------------
		
		menu_File:=Create menu:C408
		
		APPEND MENU ITEM:C411(menu_File; Localized string("HDI2_MenuNextPage"))
		SET MENU ITEM PROPERTY:C973(menu_File; -1; Associated standard action:K56:1; ak next page:K76:43)
		//SET MENU ITEM SHORTCUT(menu_File;-1;">";Command key mask)
		
		APPEND MENU ITEM:C411(menu_File; Localized string("HDI2_MenuPreviousPage"))
		SET MENU ITEM PROPERTY:C973(menu_File; -1; Associated standard action:K56:1; ak previous page:K76:44)
		//SET MENU ITEM SHORTCUT(menu_File;-1;"<";Command key mask)
		
		APPEND MENU ITEM:C411(menu_File; "-")
		
		APPEND MENU ITEM:C411(menu_File; Localized string("HDI2_MenuCloseWindow"))
		SET MENU ITEM PROPERTY:C973(menu_File; -1; Associated standard action:K56:1; ak cancel:K76:36)
		//SET MENU ITEM SHORTCUT(menu_File;-1;"W";Command key mask)
		
		APPEND MENU ITEM:C411(menu_File; Localized string("HDI2_MenuQuit"))
		SET MENU ITEM PROPERTY:C973(menu_File; -1; Associated standard action:K56:1; ak quit:K76:61)
		
		
		//-----------------------------------------------------------------------------------------------------------
		
		menu_Style:=Create menu:C408
		
		APPEND MENU ITEM:C411(menu_Style; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Style; -1; Associated standard action:K56:1; ak font bold:K76:72)
		//SET MENU ITEM SHORTCUT(menu_Style;-1;"B";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Style; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Style; -1; Associated standard action:K56:1; ak font italic:K76:71)
		//SET MENU ITEM SHORTCUT(menu_Style;-1;"I";Command key mask)
		
		
		APPEND MENU ITEM:C411(menu_Style; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Style; -1; Associated standard action:K56:1; ak font underline:K76:73)
		//SET MENU ITEM SHORTCUT(menu_Style;-1;"U";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Style; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Style; -1; Associated standard action:K56:1; ak font linethrough:K76:74)
		
		APPEND MENU ITEM:C411(menu_Style; "-")
		
		APPEND MENU ITEM:C411(menu_Style; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Style; -1; Associated standard action:K56:1; ak font show dialog:K76:77)
		//SET MENU ITEM SHORTCUT(menu_Style;-1;"T";Command key mask)
		
		//APPEND MENU ITEM(menu_Style;"font size 24")
		//SET MENU ITEM PROPERTY(menu_Style;-1;Associated standard action;"fontSize?value=24pt")
		
		
		//-----------------------------------------------------------------------------------------------------------
		
		menu_Edit:=Create menu:C408
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak cut:K76:53)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"X";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak copy:K76:54)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"C";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak paste:K76:55)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"V";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; "-")
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak select all:K76:57)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"A";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak clear:K76:56)
		
		APPEND MENU ITEM:C411(menu_Edit; "-")
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak undo:K76:51)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"Z";Command key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak redo:K76:52)
		//SET MENU ITEM SHORTCUT(menu_Edit;-1;"Z";Command key mask | Shift key mask)
		
		APPEND MENU ITEM:C411(menu_Edit; "-")
		
		APPEND MENU ITEM:C411(menu_Edit; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Edit; -1; Associated standard action:K56:1; ak show clipboard:K76:58)
		
		//-----------------------------------------------------------------------------------------------------------
		
		menu_4D:=Create menu:C408
		
		APPEND MENU ITEM:C411(menu_4D; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_4D; -1; Associated standard action:K56:1; ak show reference:K76:78)
		
		APPEND MENU ITEM:C411(menu_4D; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_4D; -1; Associated standard action:K56:1; ak compute expressions:K76:79)
		
		APPEND MENU ITEM:C411(menu_4D; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_4D; -1; Associated standard action:K56:1; ak freeze expressions:K76:80)
		
		//-----------------------------------------------------------------------------------------------------------
		
		menu_Hierarchical:=Create menu:C408
		
		
		APPEND MENU ITEM:C411(menu_Hierarchical; Localized string("HDI2_MenuCustomHint"))
		APPEND MENU ITEM:C411(menu_Hierarchical; Localized string("HDI2_MenuRevertText"))
		SET MENU ITEM PARAMETER:C1004(menu_Hierarchical; -1; "Revert")
		
		APPEND MENU ITEM:C411(menu_Hierarchical; "-")
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak cut:K76:53)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak copy:K76:54)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak paste:K76:55)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; "-")
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak font style:K76:86)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak font size:K76:87)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak font color:K76:85)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)  //"Background")  //
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak background color:K76:84)
		
		APPEND MENU ITEM:C411(menu_Hierarchical; ak standard action title:K76:83)  //"Spell")  //
		SET MENU ITEM PROPERTY:C973(menu_Hierarchical; -1; Associated standard action:K56:1; ak spell:K76:81)
		
		//-----------------------------------------------------------------------------------------------------------
		
		menu_form:=Create menu:C408
		
		APPEND MENU ITEM:C411(menu_form; Localized string("HDI2_MenuFile"); menu_File)
		APPEND MENU ITEM:C411(menu_form; Localized string("HDI2_MenuEdit"); menu_Edit)
		APPEND MENU ITEM:C411(menu_form; Localized string("HDI2_MenuStyleTitle"); menu_Style)
		APPEND MENU ITEM:C411(menu_form; Localized string("HDI2_Menu4D"); menu_4D)
		
		SET MENU BAR:C67(menu_form)
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (FORM Get current page:C276=1)
			OBJECT SET VISIBLE:C603(*; "stText"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "stText"; True:C214)
		End if 
		
		If (FORM Get current page:C276=3)
			GetActionInfos
		End if 
		
		GOTO OBJECT:C206(*; "stText")  //
		
	: (Form event code:C388=On Unload:K2:2)
		
		RELEASE MENU:C978(menu_Style)
		RELEASE MENU:C978(menu_Edit)
		RELEASE MENU:C978(menu_4D)
		
		//RELEASE MENU(menu_form)
		
End case 