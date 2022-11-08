$username = Read-Host 'Username'

$test = get-aduser $username -Properties accountexpirationdate
echo $test

echo 'Press any key to do another search'
$x = $host.UI.RawUI.ReadKey("AllowCtrlC,NoEcho,IncludeKeyDown")
invoke-expression -Command .\ADexpiration.ps1