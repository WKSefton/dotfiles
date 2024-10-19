# Log function to display messages
function Log {
    param (
        [string]$message
    )
    Write-Host "[INFO] $message"
}

# Check if the script is running with admin privileges
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Log "This script must be run as Administrator to install fonts."
    exit 1
}

# Set environment variables for Neovim and WezTerm
Log "Setting environment variables for Neovim and WezTerm..."
[System.Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', "$env:USERPROFILE\.config", [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('WEZTERM_CONFIG_FILE', "$env:USERPROFILE\.config\wezterm\wezterm.lua", [System.EnvironmentVariableTarget]::User)
# [System.Environment]::SetEnvironmentVariable('BASH_ENV', "$env:USERPROFILE\.config\git-bash\.bashrc", [System.EnvironmentVariableTarget]::User)
Log "Environment variables set."

# Font details
$fontName = "FiraCode Nerd Font"
$fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
$fontZip = "$env:USERPROFILE\Downloads\FiraCode.zip"
$fontDir = "$env:USERPROFILE\Downloads\FiraCode"  # Temporary unzip location
$windowsFontsDir = "$env:SystemRoot\Fonts"

# Check if the font is already installed by looking for it in the Fonts folder
function Is-FontInstalled {
    param (
        [string]$fontName
    )
    $installedFonts = Get-ChildItem -Path "$windowsFontsDir" -Include *.ttf, *.otf | Select-String -Pattern $fontName
    return $installedFonts.Count -gt 0
}

# Use Shell.Application to install the font
function Install-Font {
    param (
        [string]$fontPath
    )
    Log "Installing font: $fontPath"
    
    $shell = New-Object -ComObject Shell.Application
    $fontFolder = $shell.Namespace(0x14) # Special folder "Fonts"
    $fontFolder.CopyHere($fontPath)
}

# Only download and install the font if it is not already installed
if (-not (Is-FontInstalled $fontName)) {
    Log "FiraCode Nerd Font is not installed. Proceeding with download and installation..."
    
    # Download the font
    Log "Starting download of FiraCode Nerd Font..."
    Invoke-WebRequest -Uri $fontUrl -OutFile $fontZip
    Log "Download completed: $fontZip"

    # Unzip the font files
    Log "Extracting the font files to: $fontDir"
    Expand-Archive -Path $fontZip -DestinationPath $fontDir -Force
    Log "Extraction completed."

    # Install fonts using Shell.Application
    $fonts = Get-ChildItem "$fontDir\*.ttf"
    foreach ($font in $fonts) {
        Install-Font $font.FullName
    }

    # Clean up the downloaded files
    Log "Cleaning up downloaded files..."
    Remove-Item $fontZip
    Remove-Item -Recurse -Force $fontDir
    Log "Cleanup completed."
} else {
    Log "FiraCode Nerd Font is already installed. Skipping installation."
}

Log "Font installation completed successfully. Neovim and WezTerm environment variables have been set."
