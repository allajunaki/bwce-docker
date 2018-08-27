﻿function Install-SSH {

	[CmdletBinding()]
	param()

	try {

		Expand-Archive -Path "C:\resources\OpenSSH-Win64.zip" -DestinationPath "C:\Program Files\OpenSSH\"
		. "C:\Program Files\OpenSSH\OpenSSH-Win64\install-sshd.ps1"
		#powershell.exe -ExecutionPolicy Bypass -File "C:\Program Files\OpenSSH\OpenSSH-Win64\install-sshd.ps1"
		$command = "net start sshd"
		$Env:Path = $Env:Path + ";C:\Program Files\OpenSSH\OpenSSH-Win64"
		setx PATH $Env:Path /M  
		Invoke-Expression $command

	} catch {

		Write-Error -Exception $PSItem -ErrorAction Stop

	}




}

Install-SSH
