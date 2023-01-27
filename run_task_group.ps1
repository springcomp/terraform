[CmdletBinding()]
param(
	[Alias("PSPath")]
	[string]$path = "./main.tf",
	[switch]$clean
)

BEGIN {

	Remove-Item ./main.tf.~backup -EA SilentlyContinue | Out-Null
	Copy-Item ./main.tf ./main.tf.~backup

	Copy-Item ./automation/azurerm_logmanagement_provider.tf ./

}

PROCESS {

	if (-not $clean.IsPresent) {
		$module = ""

		$content = Get-Content -Path $path |% {
			if ($_ -match "^\ *module\ +\`"(?<module>[^\`"]+)\`"\ *\{?$") {
				$module = $matches["module"]
			}
			if ($_ -match "^\ *azurerm\.log\ *=\ *azurerm\ *$") {
				Write-Host "Found `"$module`" logmanagement provider requirements. Replacing…" -Foreground Green
				"    azurerm.log = azurerm.log"
			}
			else {
				$_
			}
		}

		Set-Content -Path $path -Value $content
	}
}

END {

	if ($clean.IsPresent)
	{
		Remove-Item ./azurerm_logmanagement_provider.tf
		if (Test-Path ./main.tf.~backup) {
			Remove-Item ./main.tf -EA SilentlyContinue | Out-Null
			Rename-Item -Path ./main.tf.~backup -NewName main.tf
		}
	}
}