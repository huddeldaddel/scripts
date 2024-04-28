<#
.SYNOPSIS
    create-snapshot creates btrfs snapshots of my user directory

.Description
    create-snapshot creates btrfs snapshots of my user directory. 
    Snapshots are stored right next to the user folder in /home.    
#>


class TimeMachine {
    [string]$SourceFolder

    TimeMachine([string]$SourceFolder) {
        $this.SourceFolder = $SourceFolder
    }

    [void] CreateSnapshot() {
        $timestamp = Get-Date -Format yyyy-MM-dd-HH-mm
        $snapshortName = "$($this.SourceFolder)-$timestamp"
        btrfs subvolume snapshot -r $($this.SourceFolder) $snapshortName
    }

    [bool] IsRootUser() {
        $userId = id -u
        return $userId -eq "0"
    }
}

$TimeMachine = [TimeMachine]::new('/home/tom')
if($TimeMachine.IsRootUser()) {
    $TimeMachine.CreateSnapshot()
} else {
    Write-Host "root privileges required to run this command"
}
