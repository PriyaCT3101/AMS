@echo off
echo Setting up Apartment Management System Database...

REM First, run the create_user.sql as root
echo Creating ams_user...
mysql -u root -p < create_user.sql

REM Then, run the apartment_management.sql as ams_user
echo Creating database and tables...
mysql -u ams_user -p'ams_password' < apartment_management.sql

REM Finally, insert initial users
echo Creating initial users...
mysql -u ams_user -p'ams_password' apartment_management < insert_initial_users.sql

echo Database setup completed!
echo.
echo Initial credentials created:
echo ---------------------------
echo Admin User:
echo Username: admin
echo Password: Admin@123
echo.
echo Resident User:
echo Username: resident
echo Password: Resident@123
echo.
pause 
