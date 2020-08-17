@echo off

cd /D "%~dp0"

echo Preparing localization build...

setlocal

rem In this sample, the repo root is identical to the script directory path. Adjust the value of the RepoRoot variable accordingly based on your environment.
rem Again, ensure the RepoRoot variable is set to the real repo root location, otherwise the localization toolset wouldn't work as intended.
rem Note that the resolved %~dp0 ends with \.
set RepoRoot=%~dp0..\
set OutDir=%RepoRoot%out
set NUGET_PACKAGES=%RepoRoot%packages
set LocalizationXLocPkgVer=2.0.0

echo Running localization build...

set XLocPath=%NUGET_PACKAGES%\Localization.XLoc.%LocalizationXLocPkgVer%
set LocProjectBaseDir=%RepoRoot%

dotnet "%XLocPath%\tools\netcore\Microsoft.Localization.XLoc.dll" /f "%LocProjectBaseDir%"

echo Localization build finished with exit code '%errorlevel%'.

exit /b %errorlevel%
