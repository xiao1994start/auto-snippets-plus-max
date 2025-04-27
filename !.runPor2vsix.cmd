@ECHO OFF
setlocal enabledelayedexpansion
CD /D "%~dp0\.."
ECHO %cd%

if exist "%cd%\*node*" (
    for /D %%i in (*node*) do (
        ECHO %%i
        ren "%cd%\%%i" "nodejs"
    )
)
@set path=%path%;"%cd%\nodejs";"%cd%\nodejs\node_modules";
@ECHO Node.js �汾��:
call node -v
@ECHO NPM �汾��:
call npm -v
@ECHO ��� ����ֿ�λ��:
call npm root -g

@ECHO ���ڰ�װ @vscode/vsce
call npm install -g @vscode/vsce --registry https://registry.npmmirror.com/
@ECHO �Ѱ�װ @vscode/vsce

CD /D "%cd%\auto-snippets-plus-max"
call vsce package
ECHO ��װ���
for %%i in (*.vsix) do (
    echo %%i
    call code --install-extension %%i
    move /Y "%%i" "../%%i"
)
ECHO �����װ�ű�ִ�����
@REM PAUSE > NUL
@REM timeout /T 1
