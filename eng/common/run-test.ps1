[CmdletBinding(PositionalBinding=$false)]
Param(
  [boolean]$testDesktop,
  [boolean]$testIOperation,
  [boolean]$test32,
  [boolean]$testVsi,
  [boolean]$ci,
  [string]$testRunner,
  [string]$testRunnerArgs,
  [string]$dll
)

. $PSScriptRoot\..\build-utils.ps1

function runTest() {

$run = $false;

if ($testDesktop -or $testIOperation) {
  if ($test32) {
    $run = $dll -Like "*.UnitTests.dll"
  } else {
   $run = ($dll -Like "*.UnitTests.dll") -and (-not ($dll -Like "*InteractiveHost*"))
  }
} elseif ($testVsi) {
  $run = $dll -Like "*.IntegrationTests.dll"
} else {
  $run = $dll -Like "*.IntegrationTests.dll"
}

  if (!$run) {
    return
  }

  if ($dll -Like "*netcoreapp*") {
    return
  }

  # Exclude out the ref assemblies
  if ($dll -Like "*\\ref\\*") {
    return
  }
  
  if ($dll -Like "*/ref/*") {
    return
  }

  # we use the parent dir of the dll as the target framework (originally everything was harcoded to net472, which produced a name clash when the same dll for full framework and netcore was produced)
  # $parentDirName = Split-Path (Split-Path $dll -parent) -leaf

  $args = $testRunnerArgs + " $dll"

try {
    #Write-Host "Executing with args $args"
    $dllName = Split-Path $dll -leaf
    Write-Host "Dll name $dllName"
    $html = '-html'
    $xmlpath = "G:\src\corpus\projects\sdk\working\roslyn.tests.bxl\repo\artifacts\log\Debug\$dllName.html"
    $verbose = '-verbose'
    $noshadow = '-noshadow'
    $xunit = ''
    if ($test32) {
      $xunit = 'E:\NugetCache\xunit.runner.console\2.4.1-pre.build.4059\tools\net472\xunit.console.x86.exe'
    }
    else
    {
      $xunit = 'E:\NugetCache\xunit.runner.console\2.4.1-pre.build.4059\tools\net472\xunit.console.exe'
    }
    
   if  ($dllName -eq "Microsoft.CodeAnalysis.CSharp.Emit.UnitTests.dll")
   {
      $emit1 = "G:\src\corpus\projects\sdk\working\roslyn.tests.bxl\repo\eng\emit1.cmd"
      $emit2 = "G:\src\corpus\projects\sdk\working\roslyn.tests.bxl\repo\eng\emit2.cmd"
      $emit3 = "G:\src\corpus\projects\sdk\working\roslyn.tests.bxl\repo\eng\emit3.cmd"
      $emit4 = "G:\src\corpus\projects\sdk\working\roslyn.tests.bxl\repo\eng\emit4.cmd"
      
      $j1 = Start-Process $emit1 -PassThru
      $j2 = Start-Process $emit2 -PassThru
      $j3 = Start-Process $emit3 -PassThru
      $j4 = Start-Process $emit4 -PassThru

      $j1.WaitForExit()
      $j2.WaitForExit()
      $j3.WaitForExit()
      $j4.WaitForExit()

      # $scripts | foreach { Start-Job -ScriptBlock {[scriptblock]::Create("& $_")} } | Wait-Job 
   }
   else
   {
    # Write-Host "Executing command $command"
    & $xunit $dll $verbose $noshadow $html $xmlpath
    if ($LastExitCode) {
      Throw $dllName
    }
   }
    
  } finally {
    # Throw $command
    #Get-Process "xunit*" -ErrorAction SilentlyContinue | Stop-Process
    #if ($testIOperation) {
      #Remove-Item env:\ROSLYN_TEST_IOPERATION
    #}
  }
}

runTest