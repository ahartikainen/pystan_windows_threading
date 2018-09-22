@ECHO OFF
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

Set logtimestamp=%_yyyy%-%_mm%-%_dd%_%_hour%_%_minute%_%_second%

Set file1=%CONDA_PREFIX%\Lib\distutils\_msvccompiler.py 
Set backup1=%CONDA_PREFIX%\Lib\distutils\_msvccompiler.py_%logtimestamp%.BAK
Set file1new=distutils_files\_msvccompiler.py 

Set file2=%CONDA_PREFIX%\Lib\distutils\ccompiler.py 
Set backup2=%CONDA_PREFIX%\Lib\distutils\ccompiler.py_%logtimestamp%.BAK
Set file2new=distutils_files\ccompiler.py 

COPY /V /Y %file1% /B %backup1% /B
COPY /V /Y %file1new% /B %file1% /B

COPY /V /Y %file2% /B %backup2% /B
COPY /V /Y %file2new% /B %file2% /B
