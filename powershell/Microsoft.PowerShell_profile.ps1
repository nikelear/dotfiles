$ENV:LANG = "en_US.UTF-8"

# XDG
$ENV:XDG_CONFIG_HOME="${HOME}\.config"
$ENV:XDG_CACHE_HOME="${HOME}\.cache"
$ENV:XDG_DATA_HOME="${HOME}\.local\share"
$ENV:XDG_STATE_HOME="${HOME}\.local\state"

# fzf
$ENV:FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# deno
$ENV:DENO_INSTALL="${HOME}\.local\share\.deno"

# go
$ENV:GOPATH="${HOME}\.local\share\go"

# npm
$ENV:NPM_CONFIG_USERCONFIG="${HOME}/.config/npm/npmrc"

$LOCALCONF="$HOME\Documents\PowerShell\local.ps1"
if ( Test-Path $LOCALCONF ) { . $LOCALCONF } else { echo "boke" }

function __prompt_git {
    $gst = git status --porcelain --branch 2>&1
    if ($LASTEXITCODE -ne 0) { return "" }

    $branch = ""
    $gst | ForEach-Object {
        if ($_ -match "^## ") {
            $branch = ($_ -split "\.\.\.")[0]
            $branch = $branch -replace "^## ", ""
            return
        }
    }

    $marks = ""
    if ($gst -match "behind") { $marks += "<" }
    if ($gst -match "ahead") { $marks += ">" }
    if ($gst -match "\?\?") { $marks += "?" }
    if ($gst -match "M\s") { $marks += "+" }
    if ($gst -match "\sM") { $marks += "!" }
    if ($gst -match "R\s") { $marks += "»" }
    if ($gst -match "\sD") { $marks += "x" }
    if ($gst -match "UU ") { $marks += "=" }
    if (git stash list) { $marks += "$" }

    if ($marks -ne "") {
        $marks = "[$marks]"
    }

    return " ($branch) $marks "
}

function prompt {
    Write-Host -NoNewline -ForegroundColor Green "$env:USERNAME"
    Write-Host -NoNewline -ForegroundColor Red "@$env:COMPUTERNAME "
    Write-Host -NoNewline -ForegroundColor White "$($executionContext.SessionState.Path.CurrentLocation) "
    Write-Host -NoNewline "$(__prompt_git)"
    Write-Host
    Write-Host -NoNewline "$ "
    return " "
}