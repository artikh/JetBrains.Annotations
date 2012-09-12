setlocal
pushd %~dp0
cd ..

SET BUILD_DIR=.\Build

ECHO BUILD_DIR=%BUILD_DIR%

RMDIR /S /Q %BUILD_DIR%

%SystemRoot%\Microsoft.NET\Framework\v3.5\MSBuild /t:Rebuild /p:OutDir=%BUILD_DIR%\ /p:Configuration=Release .\JetBrains.Annotations.NET.2.0.csproj

%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\MSBuild /t:Rebuild /p:OutDir=%BUILD_DIR%\ /p:Configuration=Release .\JetBrains.Annotations.csproj

.\Tools\NuGet\NuGet.exe pack .\JetBrains.Annotations.7.0.nuspec -Verbose -OutputDirectory "%BUILD_DIR%" -BasePath "%BUILD_DIR%"

popd