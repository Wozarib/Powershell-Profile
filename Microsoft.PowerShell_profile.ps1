import-module ActiveDirectory

# Aliases
New-Alias ua Unlock-ADAccount

# Unlock AD account ################################################################
# Usage: uad $username
function uad
{
param([string]$user)
    if(([string]::IsNullOrEmpty($user)) -or ($user -eq "help"))
{
    Write-Host "Enter username: "
    $user = Read-Host
    if([string]::IsNullOrEmpty($user))
    {
        Write-Host "Username can't be null or empty"
        UAD # recall function if null
    }
}

try{
        if((Get-Aduser $user -Properties LockedOut).LockedOut -eq $true)
        {
            Unlock-ADAccount -Identity $user
            Write-Host "Account unlocked ($user)."
        }
        else
        {
            Write-Host "This account doesn't seem to be locked.($user)"            
        }

    }
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
{    
    Write-Host "User not found: $user"
}
catch
{
    Write-Host "An error occured: "$error[0]
}
}
# Unlock AD account ################################################################
