@pushd NWebsec

@rem msbuild NWebsec.csproj /tv:3.5 /p:Configuration=Release /p:TargetFrameworkVersion=v3.5 /p:OutputPath="d:\nuget\nwebsecstage\lib\35" /t:Clean
@rem msbuild NWebsec.csproj /tv:4.0 /p:Configuration=Release /p:TargetFrameworkVersion=v4.0 /p:OutputPath="d:\nuget\nwebsecstage\lib\40" /t:Clean

msbuild NWebsec.csproj /tv:3.5 /p:Configuration=Release /p:TargetFrameworkVersion=v3.5 /p:OutputPath="d:\nuget\nwebsecstage\lib\35" /t:Rebuild /v:q
msbuild NWebsec.csproj /tv:4.0 /p:Configuration=Release /p:TargetFrameworkVersion=v4.0 /p:OutputPath="d:\nuget\nwebsecstage\lib\40" /t:Rebuild /v:q

@rd /s /q d:\nuget\nwebsec
@xcopy /f /y d:\nuget\nwebsecstage\lib\35\NWebsec.dll d:\nuget\nwebsec\lib\35\
@xcopy /f /y d:\nuget\nwebsecstage\lib\40\NWebsec.dll d:\nuget\nwebsec\lib\40\
@xcopy /f /y NWebsec.nuspec d:\nuget\nwebsec\
@xcopy /f /y web.config.transform d:\nuget\nwebsec\content\

@popd
@pushd NWebsec.Mvc

msbuild NWebsec.Mvc.csproj /tv:4.0 /p:Configuration=Release /p:TargetFrameworkVersion=v4.0 /p:OutputPath="d:\nuget\nwebsec.mvcstage\lib\40" /t:Rebuild /v:m

@rd /s /q d:\nuget\nwebsec.mvc
@xcopy /f /y d:\nuget\nwebsec.mvcstage\lib\40\NWebsec.Mvc.dll d:\nuget\nwebsec.mvc\lib\40\
@xcopy /f /y NWebsec.Mvc.nuspec d:\nuget\nwebsec.Mvc\

@echo "Now go to d:\nuget\nwebsec\, update nuspec version number, and publish! :)"

@popd