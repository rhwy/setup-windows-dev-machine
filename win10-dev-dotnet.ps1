# Description: Boxstarter Script
# Author: Rui Carvalho
# Dotnet core dev tools on windows 10
#--------------------------
# this works with http://boxstarter.org
# and http://chocolatey.org/ should have been installed


# ------------------------------
#  SETUP
# ------------------------------

Disable-UAC

#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

#--- Define Packages to Install ---
$ChocoCorePackages = 'python',`
            'nodejs',`
            'jre8',`
            'git.install',`
            'dotnetcore-sdk',`
            'FiraCode',`
            'dotnet4.7.2',`
            'azure-cli',`
            '7zip'
            
$ChocoToolsPackages = 'ngrok.portable',`
            'googlechrome',`
            'adobereader',`
            'conemu',`
            'postman',`
            'firefox',`
            'visualstudio2017community',`
            'visualStudioCode',`
            'vscode-csharp',`
            'vscode-mssql',`
            'vscode-csharpeextensions',`
            'microsoftazurestorageexplorer'


# ------------------------------
#  CHOCO INSTALL
# ------------------------------

#--- Windows Subsystems/Features ---
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#--- Install core Packages ---
ForEach ($PackageName in $ChocoCorePackages)
{cinst $PackageName -y}

#--- Install tools Packages ---
ForEach ($toolName in $ChocoToolsPackages)
{cinst $toolName -y}

#--- complementary Tools/Features ---

pip install --upgrade pip setuptools
pip install —upgrade httpie

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

