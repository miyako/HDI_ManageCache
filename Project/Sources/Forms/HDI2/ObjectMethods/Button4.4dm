//%attributes = {"invisible":true}

If (ThisIs64=True:C214)
	// SET CACHE SIZE is available in 64-bit only
	SET CACHE SIZE:C1399(vSize*1024*1024; vMinUnload*1024*1024)
Else 
	// Use SET DATABASE PARAMETER in 32-bit
	SET DATABASE PARAMETER:C642(Cache unload minimum size:K37:60; vMinUnload*1024*1024)
End if 

ALERT:C41(Localized string:C991("AlertMinSizeUpdated"))