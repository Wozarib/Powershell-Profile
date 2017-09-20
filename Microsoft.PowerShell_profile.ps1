# Load Active Directory module
import-module ActiveDirectory

Write-Host "Use 'la' to list locked accounts"
Write-Host "Use 'ua [username]' to unlock the specified account"
write-host " "

# Aliases / Functions
New-Alias ua Unlock-ADAccount
function la {Search-ADAccount -lockedout}
