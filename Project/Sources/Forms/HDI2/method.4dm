C_BOOLEAN:C305(ThisIs64)
C_REAL:C285(vSize; vMinUnload; vValToFree)
C_LONGINT:C283(vFlushPer)
C_TEXT:C284(vCacheInfos)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Get menu bar reference:C979="")
			SET MENU BAR:C67(1)
		End if 
		
		DISABLE MENU ITEM:C150(Get menu bar reference:C979; 1; Current process:C322)
		
		var $json : Collection
		$json:=JSON Parse:C1218(File:C1566(Localized document path:C1105("Infos.json"); fk platform path:K87:2).getText())
		
		var $Infos : Object
		Form:C1466.Infos:=$json.first()
		
		// Check 32-bit or 64-bit
		If (Version type:C495 ?? 64 bit version:K5:25)
			ThisIs64:=True:C214
			
			// Hide warnings
			OBJECT SET VISIBLE:C603(*; "Warning@"; False:C215)
		Else 
			ThisIs64:=False:C215
			
			// Disable buttons related to actions not available in 32-bit
			OBJECT SET ENABLED:C1123(*; "64@"; False:C215)
		End if 
		
		
		// Read information on cache
		vSize:=Get cache size:C1432
		vMinUnload:=Get database parameter:C643(Cache unload minimum size:K37:60)
		vFlushPer:=Get database parameter:C643(Cache flush periodicity:K37:78)
		
		// Convert to MBytes
		vSize:=vSize/(1024*1024)
		vMinUnload:=vMinUnload/(1024*1024)
		
		// Init
		vValToFree:=0
		
	: (Form event code:C388=On Unload:K2:2)
		
		ENABLE MENU ITEM:C149(Get menu bar reference:C979; 1; Current process:C322)
		
End case 