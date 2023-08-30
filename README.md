# MultiLauncher
Simple PowerShell-based helper program to help ensure programs are running


# First Time Setup
Download the PowerShell <br/>
Optional - use PS2Exe to convert the script to an executable: https://github.com/MScholtes/PS2EXE <br/>
Run the script or program to create the initial CSV file <br/>
Open the CSV in your choice of editor, list programs in the format: <br/>
<ul>
  <li>"Name" = The name of the program in Task manager</li>
  <li>"Program" = the .lnk or .exe file to run</li>
  <li>"Location" = the location of the file, use "$env:" syntax if including environment variables</li>
  <li>"Arguments" = Optional, starting arguments applied to the executable or shortcut</li>
</ul>

# Subsequent Launch
Run the script or program, and your programs will be started! Script will always pause to show errors and confirmations.
