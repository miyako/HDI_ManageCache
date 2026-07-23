C_BOOLEAN:C305(ThisIs64)
C_REAL:C285(vSize; vMinUnload; vValToFree)
C_LONGINT:C283(vFlushPer)
C_TEXT:C284(vCacheInfos)


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		// Load text to show in "Info" tab
		ALL RECORDS:C47([Infos:1])
		GOTO RECORD:C242([Infos:1]; 0)
		
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
		
End case 

