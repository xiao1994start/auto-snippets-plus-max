@ECHO OFF
setlocal enabledelayedexpansion
CD /D "%~dp0"


@REM https://blog.csdn.net/weixin_42390185/article/details/137213273#:~:text=%E6%9C%AC%E6%96%87%E5%B0%86%E6%8C%87%E5%AF%BC%E8%AF%BB%E8%80%85%E9%80%90%E6%AD%A5%E5%AD%A6
goto :yoHELP

echo ��������
@REM ���ذ�װ vscode ��չ��������
npx --package yo --package generator-code -- yo code
@REM ȫ�ְ�װ vscode ��չ��������
npm install --global yo generator-code
yo code
@REM ���� TypeScript ��Ŀ������д�����ֶΣ�
@REM ---------------------------------------------------------------------------
# ? What type of extension do you want to create? New Extension (TypeScript)
# ? What's the name of your extension? HelloWorld
### Press <Enter> to choose default for all options below ###

# ? What's the identifier of your extension? helloworld
# ? What's the description of your extension? LEAVE BLANK
# ? Initialize a git repository? Yes
# ? Bundle the source code with webpack? No
# ? Which package manager to use? npm

# ? Do you want to open the new folder with Visual Studio Code? Open with `code`
@REM ---------------------------------------------------------------------------

echo ������չ
@REM ��װ�������
npm install @vscode/vsce
@REM ȫ�ְ�װ�������
npm install -g @vscode/vsce
@REM ʹ�� vsce���� ��� �� ���� ������չ��
@REM ---------------------------------------------------------------------------
$ cd myExtension
$ vsce package
# myExtension.vsix generated
$ vsce publish
# <publisher id>.myExtension published to VS Code Marketplace
@REM ---------------------------------------------------------------------------
@REM vsce����������������Ԫ���ݺ�ȡ��������չ�� �й����п��õĲο� vsce������У�
vsce -V
vsce --version
vsce -h
vsce --help

:yoHELP
