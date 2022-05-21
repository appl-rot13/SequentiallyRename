@echo off
chcp 65001

setlocal enabledelayedexpansion

set target_dir=%~dp0
set bat_filename=%~n0%~x0

set /a count=1

for /f "tokens=*" %%f in (
  'dir "%target_dir%" /a-d /b'
) do (
  if not %%f==%bat_filename% (
    set filename=0!count!
    set filename=!filename:~-2,2!%%~xf

    echo "%target_dir%%%f" -^> "!filename!"
    rename "%target_dir%%%f" "!filename!"

    set /a count=count+1
  )
)

pause
