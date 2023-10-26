function ScriptTo-UnicodeBase64 {
    param(
        [string]$FilePath
    )
    if((Test-path -Path $FilePath) -eq $true)
    {
        try{
            $content = Get-Content $FilePath
            return [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes("$content"))
        }
        catch 
        {
            write-host "Fout bij omzetten naar Base64: $_"
        }
    }
    else {
            write-host "File [$FilePath] not found"
    }
}

function ScriptFrom-Base64 {
    param (
        [string]$Base64Data
    )
    
    try {
        $fileBytes = [System.Convert]::FromBase64String($Base64Data)
        $scriptContent = [System.Text.Encoding]::UTF8.GetString($fileBytes)
        return $scriptContent
    } catch {
        Write-Error "Er is een fout opgetreden: $_"
    }
}


# Voorbeeldgebruik voor encoding
$bestandspad = ".\Loader.ps1"
$base64Data = ScriptTo-UnicodeBase64 -FilePath $bestandspad
$base64Data | clip
Write-Output "Base64Data copied to clipboard: $base64Data"

# Voorbeeldgebruik voor decoding
#$base64Data = "base64-data hier" # 
$scriptContent = ScriptFrom-Base64 -Base64Data $base64Data
Write-Output "Scriptinhoud: $scriptContent"
