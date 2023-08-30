# MultiLauncher
Simple PowerShell-based helper program to help ensure programs are running


# First Time Setup
Download the PowerShell
Optional - use PS2Exe to convert the script to an executable: https://github.com/MScholtes/PS2EXE
Run the script or program to create the initial CSV file
Open the CSV in your choice of editor, and type the programs to check in the format:
  "Name" = The name of the program in Task manager
  "Program" = the .lnk or .exe file to run
  "Location" = the location of the file, use "$env:" syntax if including environment variables
  "Arguments" = Optional, starting arguments applied to the executable or shortcut

# Subsequent Launch
Run the script or program, and your programs will be started! Script will always pause to show errors and confirmations.
