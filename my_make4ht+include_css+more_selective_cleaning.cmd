@echo off
chcp 65001 >nul
echo.============================================================================
echo                                ВНИМАНИЕ!
echo.
echo Чтобы внедрить (с помощью опции css-in) в результирующий html-файл 
echo css-файл, создаваемый в процессе компиляции, [93mкорневая директория должна 
echo содержать модифицированный файл html5.4ht[0m !
echo.
echo ----------------------------------------------------------------------------
echo                                ATTENTION!
echo.
echo To inject (with the css-in option) the css-file created during the 
echo compilation process into the resulting html-file, [93mthe root directory 
echo must contain a modified html5.4ht file[0m !
echo.============================================================================
echo.
echo [92m1. Creation of %~n1.html[0m
echo.
if exist tmp (
  rd /s /q tmp
)
md tmp

make4ht -sc myconfig.cfg %1 "0,p-indent,charset=utf-8" "-shell-escape -cunihtf -utf8" -dtmp/
echo.
echo [92m2. Embedding css-file %~n1.css in %~n1.html[0m
echo.
make4ht -sc myconfig.cfg -m draft %1 "0,p-indent,charset=utf-8,css-in" "-shell-escape" -dtmp/
echo.
move %~n1.html tmp
move %~n1.css tmp
echo [92m3. "Cleaning" of %~n1.html[0m
echo.
@REM perl -p -i.bak -e "s/<\/a>,(\xC2\xA0|\x00\xA0|&#xC2A0;|&#x00A0;)<a/<\/a>, <a/g";  -e "s/,(\xC2\xA0|\x00\xA0|&#xC2A0;|&#x00A0;)<\/span>/, <\/span>/g"; -e "s/.figure \&gt; p/.figure \> p/g" %~n1.html | rem

@REM echo To delete working files of make4ht press ENTER.
@REM SET choice=
@REM SET /p choice=To keep working files of make4ht enter any symbol and press ENTER:
@REM IF NOT '%choice%'=='' GOTO exit

for %%a in (%~n1.html.bak %~n1.4ct %~n1.4tc %~n1.dvi %~n1.out %~n1.idv %~n1.igv %~n1.lg %~n1.tmp %~n1.xref) do if exist "%%a" del "%%a"


::exit
exit

