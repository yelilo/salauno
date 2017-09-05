@echo off


title Buscando actualizaciones App
color 9
CHDIR "C:\xampp\htdocs"

git clone https://github.com/yelilo/salauno.git

CHDIR "C:\xampp\htdocs\salauno" 

git fetch
git pull origin master

pause
exit