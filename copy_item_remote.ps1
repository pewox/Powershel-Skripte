$Session = New-PSSession -cn jus018agrud
Copy-Item "C:\Users\adm_wohlfarthp\PSScripts\bluescreenview_setup.exe" -Destination "c:\users\adm_wohlfarthp\documents" -ToSession $Session

# sfc /scannow
