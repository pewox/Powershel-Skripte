while($true){
    Invoke-Command -cn jus018agrud -ScriptBlock{Get-CimInstance -ClassName win32_processor | measure LoadPercentage -Average |
        select Average}; Start-Sleep 2
}
