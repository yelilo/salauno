@echo off


title Buscando actualizaciones App
color 9
CHDIR "C:\xampp\htdocs\salauno"

git clone https://github.com/eduardohb222/salauno_correcciones >temp.txt

set /p myVarDate= < temp.txt
echo %myVarDate%
del temp.txt
pause
exit