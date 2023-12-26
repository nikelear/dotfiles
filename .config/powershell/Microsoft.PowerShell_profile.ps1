$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:LANG = "en_US.UTF-8"
Set-Alias wget Invoke-WebRequest
Invoke-Expression (&starship init powershell)
