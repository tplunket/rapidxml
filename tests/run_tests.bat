@echo off
setlocal

set "COMPILER=Visual Studio"

:ParseArgs
if "%1"=="" goto :DoneArgs

if "%1"=="11" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 11"
if "%1"=="2012" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 11"
if "%1"=="14" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 14"
if "%1"=="2015" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 14"
if "%1"=="15" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 15"
if "%1"=="2017" set "COMPILER_VERSIONS=%COMPILER_VERSIONS% 15"

if /i "%1"=="win32" set "COMPILER_ARCHITECTURES=%COMPILER_ARCHITECTURES% 32"
if /i "%1"=="32" set "COMPILER_ARCHITECTURES=%COMPILER_ARCHITECTURES% 32"
if /i "%1"=="win64" set "COMPILER_ARCHITECTURES=%COMPILER_ARCHITECTURES% 64"
if /i "%1"=="64" set "COMPILER_ARCHITECTURES=%COMPILER_ARCHITECTURES% 64"
if /i "%1"=="arm" set "COMPILER_ARCHITECTURES=%COMPILER_ARCHITECTURES% arm"

if /i "%1"=="debug" set "COMPILER_CONFIGS=%COMPILER_CONFIGS% Debug"
if /i "%1"=="release" set "COMPILER_CONFIGS=%COMPILER_CONFIGS% Release"

shift
goto :ParseArgs
:DoneArgs

if "%COMPILER_VERSIONS%"=="" set "COMPILER_VERSIONS=11 14 15"
if "%COMPILER_ARCHITECTURES%"=="" set "COMPILER_ARCHITECTURES=32 64"
if "%COMPILER_CONFIGS%"=="" set "COMPILER_CONFIGS=Debug Release"

set NUM_RUNS=0
set NUM_ERRORS=0
for %%v in (%COMPILER_VERSIONS%) do (
    for %%a in (%COMPILER_ARCHITECTURES%) do (
        for %%c in (%COMPILER_CONFIGS%) do (
            call :Build %%v %%a %%c
        )
    )
)

echo %NUM_RUNS% build and test cycles completed with %NUM_ERRORS% failures.
if not "%ERROR_TARGETS%"=="" echo Error targets: %ERROR_TARGETS%
exit /b %NUM_ERRORS%

:Build
    if "%1"=="11" set "COMPILER_VERSION=11 2012"
    if "%1"=="14" set "COMPILER_VERSION=14 2015"
    if "%1"=="15" set "COMPILER_VERSION=15 2017"
    if "%2"=="32" set COMPILER_ARCHITECTURE=
    if "%2"=="64" set COMPILER_ARCHITECTURE=Win64
    if "%2"=="arm" set COMPILER_ARCHITECTURE=ARM
    set COMPILER_CONFIG=%3

    if "%COMPILER_ARCHITECTURE%"=="" (
        set GENERATOR="%COMPILER% %COMPILER_VERSION%"
    ) else (
        set GENERATOR="%COMPILER% %COMPILER_VERSION% %COMPILER_ARCHITECTURE%"
    )

    set VS_SHORTNAME=vs%COMPILER_VERSION:~0,2%.%COMPILER_ARCHITECTURE%
    set MY_OUTDIR=_out\%VS_SHORTNAME%
    if not exist %MY_OUTDIR% md %MY_OUTDIR%
    pushd %MY_OUTDIR%

    cmake -G %GENERATOR% ../.. && cmake --build . --config %COMPILER_CONFIG% -j && ctest -C %COMPILER_CONFIG%
    ::cmake -G %GENERATOR% ../.. && cmake --build . --config %COMPILER_CONFIG% -j

    popd
    set /a NUM_RUNS+=1
    if ERRORLEVEL 1 (
        set /a NUM_ERRORS+=1
        set "ERROR_TARGETS=%ERROR_TARGETS% %VS_SHORTNAME%.%COMPILER_CONFIG%"
    )
    goto :eof

