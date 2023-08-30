#Set-PSDebug -Trace 1

if (-not (Test-Path -Path '.\Startup.csv')) {
    $sample = @(
        [pscustomobject]@{Name="Name of Program"; Program="Program.exe or Program.lnk"; 'Location'="Drive:\Folder\Path\To\Program"; Arguments="Argument or delete"},
        [pscustomobject]@{Name="ProgramName"; Program="Program.exe"; Location="C:\ProgramLocation"; Arguments="-silent true"},
        [pscustomobject]@{Name="Program2"; Program="Program2.exe"; Location="C:\ProgramLocation\Subfolder"; Arguments=""},
        [pscustomobject]@{Name="Discord"; Program="Update.exe"; Location='$env:LOCALAPPDATA\Discord'; Arguments="--processStart Discord.exe"}
    )
    #ConvertTo-Json -InputObject $sample | Out-File -FilePath Startup.json
    $sample | Export-CSV -Path .\startup.csv -NoTypeInformation
    Write-Output("Startup.csv created, add programs to run")
    explorer .\
    pause
    exit
}

$programList = Import-CSV .\startup.csv

$curRunning = Get-Process

#Loop through each program
foreach ($Program in $programList)
{
	#Set variables for current program
    $curName = $Program.Name
    $curExe = $Program.Program
    $curLoc = $Program.Location

	#Check if arguments are present
    if ($Program.Arguments){
        $curArgs = $Program.Arguments
    } else {
        $curArgs = $False
    }

    #Check to see if program is running
    $Running = ($curRunning | Where-Object {$_.Name -eq $curName})

    #If program is not running, start it
    if (-not $Running) {
        #Check if working directory is required
        if ($curLoc) {
            $curLoc = $ExecutionContext.InvokeCommand.ExpandString($curLoc)
            cd $curLoc
        }
        
        #Note whether the program has been started or not
        Write-Output("Starting "+$curName)
        if ($curArgs) {
            Start-Process ".\$curExe" $curArgs -RedirectStandardError "NUL"
#            Write-Output "Starting $curName $curArgs at $curLoc."
        } else {
            Start-Process ".\$curExe" -RedirectStandardError "NUL"
#            Write-Output "Starting $curName at $curLoc."
        }
    } else {
		#Note whether the program is running or not
		Write-Output($curName+" is already running")
    }
}
pause