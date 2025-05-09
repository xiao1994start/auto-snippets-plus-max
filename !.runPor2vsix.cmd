@ECHO OFF
setlocal enabledelayedexpansion
CD /D "%~dp0"
for %%v in ("auto-snippets-plus-max-*.vsix") do (
    ECHO 清理旧版插件 %%v
    del /F /Q "%%v"
)

CD /D "%~dp0\.."
ECHO %cd%

if exist "%cd%\*node*" (
    for /D %%i in (*node*) do (
        ECHO %%i
        ren "%cd%\%%i" "nodejs"
    )
)
@set path=%path%;"%cd%\nodejs";"%cd%\nodejs\node_modules";
@ECHO Node.js 版本号:
call node -v
@ECHO NPM 版本号:
call npm -v
@ECHO 检查 软件仓库位置:
call npm root -g

@ECHO 正在安装 @vscode/vsce
call npm install -g @vscode/vsce --registry https://registry.npmmirror.com/
@ECHO 已安装 @vscode/vsce

CD /D "%cd%\auto-snippets-plus-max"
call vsce package
ECHO 封装完成
for %%i in (*.vsix) do (
    echo %%i
    call code --install-extension %%i
    @REM move /Y "%%i" "..\%%i"
    copy /V /Y "%%i" "..\%%i"
)
ECHO 插件封装脚本执行完毕
@REM PAUSE > NUL
@REM timeout /T 1
