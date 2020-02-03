@echo off
powershell -ExecutionPolicy Unrestricted -NoProfile -command "& """%~dp0eng\build.ps1""" -build -MSBuildRepo  G:\src\corpus\repo\MSBuild -SDKRepo G:\src\corpus\repo\sdk -pathToBxl G:\src\BuildXL\Out\Bin\Release\win-x64\bxl.exe %*"
