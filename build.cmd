@echo off
pushd "%~dp0"

SET CONAN_USER_HOME=c:\data
dir c:\data

powershell Invoke-WebRequest -o C:\TEMP\conan.exe https://dl.bintray.com/conan/installers/conan-win-32_1_26_0.exe 
C:\TEMP\conan.exe /VERYSILENT /DIR="c:\conan\"
c:\conan\conan\conan.exe profile new default --detect

c:\conan\conan\conan.exe remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan True 
c:\conan\conan\conan.exe install --build=missing protobuf/3.9.1@bincrafters/stable
:exit
popd
@echo on
