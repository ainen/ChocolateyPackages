﻿$ErrorActionPreference = 'Stop';
$packageName = 'sumo'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkExe      = 'AutoHotKey'
$ahkFile     = "$toolsDir\SUMo_Install.ahk"
$url         = 'https://www.kcsoftwares.com/files/sumo_lite.exe'
$checksum    = 'FE06549454566A507F341872B1F2AAFF9805722C4EED179044111DF4EAD28693'

$packageArgs = @{
    packageName    = $packageName
    url            = $url
    checksum       = $checksum
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)   
}

Start-Process $ahkExe $ahkFile
Install-ChocolateyPackage @packageArgs
Start-Sleep -s 10
Start-CheckandStop "SUMo"  
