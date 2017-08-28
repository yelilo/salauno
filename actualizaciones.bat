@echo off


title Buscando actualizaciones App
color 9
CHDIR "C:\xampp\htdocs\salauno"

git clone https://github.com/yelilo/salauno.git >temp.txt

set /p myVarDate= < temp.txt
echo %myVarDate%
del temp.txt
pause
exit