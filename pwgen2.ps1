$signs = ((33..47)+(58..64)+(91..96)+(123..126) | Get-Random -count 2).foreach{[char]$_}
$letterup = ((65..90) | Get-Random -count 6).foreach{[char]$_}
$letterlow = ((97..122) | Get-Random -count 6).foreach{[char]$_}
$number = ((48..57) | Get-Random -count 6).foreach{[char]$_}
$password = -join ($signs+$letterup+$letterlow+$number | Get-Random -Count ([int]::MaxValue))
$password
