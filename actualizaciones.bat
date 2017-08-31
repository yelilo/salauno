@echo off


title Buscando actualizaciones App
color 9
CHDIR "C:\xampp\htdocs"

git clone https://github.com/yelilo/salauno.git

CHDIR "C:\xampp\htdocs\salauno_correcciones" 

git fetch
git pull origin master

pause
exit