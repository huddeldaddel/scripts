$today = Get-Date -f yyyy-MM-dd
tar -czvf "$today.tar.gz" ~
shutdown -h now
