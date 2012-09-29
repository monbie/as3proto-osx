@echo off
title Protobuf for Actionscript 3
color 0a
cls

call setup.bat

rem DO NOT MODIFY IT
set PROTOC=%SDK%\protoc.exe

rem Make a directory for output if not exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:LOOP

cls
echo ----------------------------
echo Type proto file name:
set /p PROTO_FILE=

set PROTO_FILE=%PROTO_DIR%\%PROTO_FILE%

if not exist "%PROTO_FILE%" (
	set PROTO_FILE=%PROTO_FILE%.proto
)

if not exist "%PROTO_FILE%" (
	echo %PROTO_FILE% does not exist, press any key to try again...
	pause>nul
	call:LOOP
)

echo\
echo ... ... ...

@echo on
@rem Generate AS3 code from *.proto file
%PROTOC% --proto_path="%PROTO_DIR%" --as3_out="%OUTPUT_DIR%" "%PROTO_FILE%"
@echo off

echo\
echo DONE! Press any key to process another proto file...
pause>nul

call:LOOP