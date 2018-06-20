# setup-windows-dev-machine
My setup to automate machine install with chocolatey+boxstarter 

## Step 1

Prepare BoxStarter:

Start Powershell as an adminstrator and update execution policy:

```ps
 Set-ExecutionPolicy Unrestricted -force
```
 
Install the Boxstarter bootstrapper (will install chocolatey too)

```ps
 . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
```


## Step 2

Run the install script for boxstarter 
<a href='http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/rhwy/setup-windows-dev-machine/master/win10-dev-dotnet.ps1'>Start!</a>

or directly from powershell:

```
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/rhwy/setup-windows-dev-machine/master/win10-dev-dotnet.ps1 -DisableReboots
```

