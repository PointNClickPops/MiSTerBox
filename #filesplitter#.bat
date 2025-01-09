@echo on
setlocal enabledelayedexpansion

rem Counter for file names
set count=100001

rem Read file-list.txt and split each line into its own file
for /f "delims=" %%i in (file-list.txt) do (
    set "line=%%i"
    echo !line! > "line_!count!.bat"
    set /a count+=1
)

endlocal
