$token = "55776ef2c85b6ca713c1ea0377b99e00"
$domain = "inventica-msp"
$COMODOpath = Join-Path -ChildPath "COMODO\COMODO ITSM" -Path ${env:ProgramFiles(x86)}
if (Test-Path -Path $COMODOpath -eq $false){
    $COMODOpath = Join-Path -ChildPath "COMODO\COMODO ITSM" -Path ${env:ProgramFiles}
}
$inipath = Join-Path -ChildPath "enrollment_config.ini" -Path $COMODOpath
$ini = """
[General]
token = $($token)
host = $($domain).cmdm.comodo.com
port = 443
suite = 4
remove_third_party = false
"""
Out-File -FilePath $inipath -Encoding utf8 -InputObject $ini
& . "$($COMODOpath)\ITSMService.exe -c 2"
