<#
.SYNOPSIS
    copy-snapshots synchronizes btrfs snapshots in /home with backups on an USB drive.

.Description
    copy-snapshots makes incremental copies of btrfs snapshots in /home to an USB drive    
#>


class TimeMachine {
    [string]$SourceFolder
    [string]$TargetFolder

    TimeMachine([string]$SourceFolder, [string]$TargetFolder) {
        $this.SourceFolder = $SourceFolder
        $this.TargetFolder = $TargetFolder
    }

    [void] CopySnapshots() {
        $sourceFolderPath = Get-Item $this.SourceFolder
        $snapshots = Get-ChildItem -Path $($sourceFolderPath.Parent) -Filter "$($sourceFolderPath.Name)-*"
        $lastSnapshot = ""
        foreach($snapshot in $snapshots) {
            $snapshotTarget = "$($this.TargetFolder)/$($snapshot.Name)"
            if (!(Test-Path -Path $snapshotTarget)) {
                if($lastSnapshot -eq "") {
                    Write-Host "Tranferring full copy of snapshot"
                    btrfs send $snapshot | btrfs receive $($this.TargetFolder)
                } else {
                    Write-Host "Tranferring incremental copy of snapshot"
                    btrfs send -p $lastSnapshot $snapshot | btrfs receive $($this.TargetFolder)
                }
            }
            $lastSnapshot = $snapshot.FullName
        }
    }

    [bool] IsRootUser() {
        $userId = id -u
        return $userId -eq "0"
    }
}

$TimeMachine = [TimeMachine]::new('/home/tom', '/media/tom/TimeShift')
if($TimeMachine.IsRootUser()) {
    $TimeMachine.CopySnapshots()    
} else {
    Write-Host "root privileges required to run this command"
}
