# Prompts the user for the name of the VPN connection.
$ConnectionName = Read-Host "Please enter the name of the VPN connection"

# EDIT THIS SECTION
# Set the DestinationPrefix value to the IP address block provided by the Support Desk.
# Duplicate the following line if additionals routes are required for your VPN connection.
Add-VpnConnectionRoute -ConnectionName $ConnectionName -DestinationPrefix "10.1.0.0/16" -PassThru

# Enables split tunneling so encrypted application traffic travels over the VPN connection
# while all other traffic travels over your regular Internet connection.
Set-VpnConnection -Name $ConnectionName -SplitTunneling $True

# Prompts the user to close the window upon completion.
if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to close this window..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}