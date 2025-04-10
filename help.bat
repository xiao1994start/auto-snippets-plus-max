@ECHO OFF
setlocal enabledelayedexpansion
CD /D "%~dp0"


@REM https://blog.csdn.net/weixin_42390185/article/details/137213273#:~:text=%E6%9C%AC%E6%96%87%E5%B0%86%E6%8C%87%E5%AF%BC%E8%AF%BB%E8%80%85%E9%80%90%E6%AD%A5%E5%AD%A6
goto :yoHELP

echo 构建工具
@REM 本地安装 vscode 扩展开发工具
npx --package yo --package generator-code -- yo code
@REM 全局安装 vscode 扩展开发工具
npm install --global yo generator-code
yo code
@REM 对于 TypeScript 项目，请填写以下字段：
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

echo 发布扩展
@REM 安装打包工具
npm install @vscode/vsce
@REM 全局安装打包工具
npm install -g @vscode/vsce
@REM 使用 vsce轻松 打包 和 发布 您的扩展：
@REM ---------------------------------------------------------------------------
$ cd myExtension
$ vsce package
# myExtension.vsix generated
$ vsce publish
# <publisher id>.myExtension published to VS Code Marketplace
@REM ---------------------------------------------------------------------------
@REM vsce还可以搜索、检索元数据和取消发布扩展。 有关所有可用的参考 vsce命令，运行：
vsce -V
vsce --version
vsce -h
vsce --help

:yoHELP
