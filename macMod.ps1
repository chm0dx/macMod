param (
	[string]$rootDir = "."
)

function modM
{
	[DateTime]$min = $_.CreationTime
	[DateTime]$max = [DateTime]::Now
	$rg = New-object random
	$rt = [Convert]::ToInt64(($max.Ticks * 1.0 - $min.Ticks * 1.0) * $rg.NextDouble() + $min.Ticks * 1.0);
	Write-Host `t Old MTime    -    $_.LastWriteTime;
	$_.LastWriteTime = new-object DateTime($rt)
	Write-Host `t New MTime    -    $_.LastWriteTime
}

function modA
{
	[DateTime]$min = $_.CreationTime
	[DateTime]$max = [DateTime]::Now
	$rg = New-object random
	$rt = [Convert]::ToInt64(($max.Ticks * 1.0 - $min.Ticks * 1.0) * $rg.NextDouble() + $min.Ticks * 1.0);
	Write-Host `t Old ATime    -    $_.LastAccessTime;
	$_.LastAccessTime = new-object DateTime($rt)
	Write-Host `t New ATime    -    $_.LastAccessTime
}

function modC
{
	[DateTime]$min = '1/1/2000'
	[DateTime]$max = [DateTime]::Now
	$rg = New-object random
	$rt = [Convert]::ToInt64(($max.Ticks * 1.0 - $min.Ticks * 1.0) * $rg.NextDouble() + $min.Ticks * 1.0);
	Write-Host `t Old CTime    -    $_.CreationTime;
	$_.CreationTime = new-object DateTime($rt)
	Write-Host `t New CTime    -    $_.CreationTime
}

Write-Host `r`n'Digging in...'`r`n

Get-ChildItem $root -recurse | ForEach-Object { Write-Host $_.Name; modC($_); modM($_); sleep -m 1; modA($_); }

Write-Host `r`n'Done!'