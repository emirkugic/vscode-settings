@echo off
SetLocal EnableDelayedExpansion

if "%1"=="-h" (
	  powershell -NoProfile -Command "Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, @{Name='Used'; Expression={ if ($_.Used -gt 1GB) { '{0:N2} GB' -f ($_.Used / 1GB) } else { '{0:N0} MB' -f ($_.Used / 1MB) }}}, @{Name='Free'; Expression={ if ($_.Free -gt 1GB) { '{0:N2} GB' -f ($_.Free / 1GB) } else { '{0:N0} MB' -f ($_.Free / 1MB) }}}, @{Name='Total'; Expression={ if (($_.Used + $_.Free) -gt 1GB) { '{0:N2} GB' -f (($_.Used + $_.Free) / 1GB) } else { '{0:N0} MB' -f (($_.Used + $_.Free) / 1MB) }}}, @{Name='PercentUsed'; Expression={ '{0:P0}' -f ($_.Used / ($_.Used + $_.Free)) }}, Root | Format-Table -AutoSize"
	  ) else (
	  	  powershell -NoProfile -Command "Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free, @{Name='Total'; Expression={ $_.Used + $_.Free }}, @{Name='PercentUsed'; Expression={ '{0:P0}' -f ($_.Used / ($_.Used + $_.Free)) }}, Root | Format-Table -AutoSize"
	  	  )

	  	  EndLocal
	  	  
	  )
)
