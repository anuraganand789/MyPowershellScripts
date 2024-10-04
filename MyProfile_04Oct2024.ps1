function Start-LocalPostgress {
    Start-Job -Name "Start-LocalPostgress-Job" -ScriptBlock { pg_ctl start -D D:\postgresql-installation\data-folder };
}

function Stop-LocalPostgress {
    Start-Job -Name "Stop-LocalPostgress-Job" -ScriptBlock { pg_ctl stop -D D:\postgresql-installation\data-folder };
}

if(! (Test-Path Alias:\Start-Vim)) { 
	New-Alias -Name Start-Vim -Scope Local -Value "C:\Program Files (x86)\Vim\vim90\vim.exe"; 
};

Set-Location -Path D:\LearningPowershell;

function prompt {
	if( Test-Path -Path .\.git\HEAD ) {
	  $array = (Get-Content -Path .\.git\HEAD) -split '/';
		$branchName = $array[$array.Length - 1];
    return "$($executionContext.SessionState.Path.CurrentLocation) (`e[31m$branchName`e[m)$('>' * ($nestedPromptLevel + 1)) ";
	}
  return "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}
