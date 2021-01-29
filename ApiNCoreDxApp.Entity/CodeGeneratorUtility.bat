::
::
echo off
echo........................................
echo Generate solution code from added Entity classes
echo........................................
echo off
:PROMPT
SET /P AREYOUSURE=Are you sure you want to delete generated files(Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

::Select the VS version
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\TextTransform.exe"
SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\TextTransform.exe"

echo off
echo Delete previously generated cs code files 
 DEL /F "1_t4EntityHelpersGenerate.cs"
 DEL /F "..\ApiNCoreDxApp.Domain\Domain\2_t4DomainViewModelsGenerate.cs"	
 DEL /F "..\ApiNCoreDxApp.Domain\Mapping\3_t4DomainMappingProfileGenerate.cs"	
 DEL /F "..\ApiNCoreDxApp.Domain\Service\4_t4DomainServicesGenerate.cs"	
 DEL /F "..\ApiNCoreDxApp.Api\Controllers\5_t4ApiControllerGenerate.cs"	
 DEL /F "..\ApiNCoreDxApp.Api\5_t4ApiStartupAdditionsGenerate.cs"	
 DEL /F "..\ApiNCoreDxApp.Test\6_t4IntegrationTestGenerate.cs"
echo .
echo Run all T4s...
echo -generate entity helpers
%tt% "1_t4EntityHelpersGenerate.tt" -out "1_t4EntityHelpersGenerate.cs"
echo -generate domain classes
%tt% "..\ApiNCoreDxApp.Domain\Domain\2_t4DomainViewModelsGenerate.tt" -out "..\ApiNCoreDxApp.Domain\Domain\2_t4DomainViewModelsGenerate.cs"
echo -generate mapper classes
%tt% "..\ApiNCoreDxApp.Domain\Mapping\3_t4DomainMappingProfileGenerate.tt" -out "..\ApiNCoreDxApp.Domain\Mapping\3_t4DomainMappingProfileGenerate.cs"	
echo -generate services classes
%tt% "..\ApiNCoreDxApp.Domain\Service\4_t4DomainServicesGenerate.tt" -out "..\ApiNCoreDxApp.Domain\Service\4_t4DomainServicesGenerate.cs"	
echo -generate controller classes
%tt% "..\ApiNCoreDxApp.Api\Controllers\5_t4ApiControllerGenerate.tt" -out "..\ApiNCoreDxApp.Api\Controllers\5_t4ApiControllerGenerate.cs"
echo -generate extended Startup code
%tt% "..\ApiNCoreDxApp.Api\5_t4ApiStartupAdditionsGenerate.tt" -out "..\ApiNCoreDxApp.Api\5_t4ApiStartupAdditionsGenerate.cs"	
echo -generate test classes
%tt% "..\ApiNCoreDxApp.Test\6_t4IntegrationTestGenerate.tt" -out "..\ApiNCoreDxApp.Test\6_t4IntegrationTestGenerate.cs"	
echo T4s completed.
pause
:END