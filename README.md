# plus-snippets-max README

整理代码片段包括 ` BAT, Python, JSON, SCSS, TypeScript, JavaScript, Vue, Vue HTML, HTML`...
更新日志:
日期: 2022-03-03 16:59:49
添加大量代码片段

---

## BAT

### 1. 编码语言页

| 钩子      | 代码                      |
| --------- | ------------------------- |
| utf-8     | :: UTF-8<br />chcp 65001  |
| gbk-zh-cn | :: GBK 中文<br />chcp 936 |

### 2. 环境变量

| 钩子             | 代码                                        |
| ---------------- | ------------------------------------------- |
| cd-cwd           | CD /D "%~dp0"                               |
| cwd              | "%~dp0"                                     |
| dr2r             | "%~dp0R2R\"                                 |
| AXX -ProTools    | "%COMMONPROGRAMFILES%\Avid\Audio\Plug-Ins\" |
| CommonFiles      | "%COMMONPROGRAMFILES%\"                     |
| CommonFiles -86  | "%COMMONPROGRAMFILES(x86)%\"                |
| ProgramData      | "%PROGRAMDATA%\"                            |
| ProgramFiles     | "%PROGRAMFILES%\"                           |
| ProgramFiles -86 | "%PROGRAMFILES(X86)%\"                      |
| public           | "%PUBLIC%\"                                 |
| AppData          | "%USERPROFILE%\AppData\"                    |
| Local            | "%USERPROFILE%\AppData\Local\"              |
| LocalLow         | "%USERPROFILE%\AppData\LocalLow\"           |
| Roaming          | "%USERPROFILE%\AppData\Roaming\"            |
| Users            | "%USERPROFILE%\"                            |
| VSTPlugins       | "%PROGRAMFILES%\VSTPlugins\"                |
| VST3             | "%COMMONPROGRAMFILES%\VST3\"                |
| Windir           | "%WINDIR%\"                                 |
| System32         | "%WINDIR%\system32\"                        |
| Desktop          | "%USERPROFILE%\Desktop\"                    |
| Documents        | "%USERPROFILE%\Documents\"                  |

### 3. 逻辑运算

| 钩子                                | 代码                                                                                                                                                                         |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| if -Not-Exist                       | if not exist 判断目标 (<br /> echo 目标不存在<br />)                                                                                                                         |
| if -IEQU                            | if /I "被比较字符串"=="对比字符串" (<br /> @echo 一致<br />)                                                                                                                 |
| if -EQU                             | if "被比较字符串"=="对比字符串" (<br /> @echo 完全一致<br />)                                                                                                                |
| if -INEQ                            | if /I "被比较字符串" NEQ "对比字符串" (<br /> echo 不一致<br />)                                                                                                             |
| if -NEQ                             | if not "被比较字符串"=="对比字符串" (<br /> echo 完全不一致<br />)                                                                                                           |
| for -do                             | for %%i in (\*) do (<br />@echo %%i<br />)                                                                                                                                   |
| for -D                              | for /D %%i in (\*) do (<br /> @echo %%i<br />)                                                                                                                               |
| for -R                              | for /R %%i in (\*) do (<br /> @echo %%i<br />)                                                                                                                               |
| for -FileNumber                     | set num=0<br />for %%i in (\*) do (<br /> echo %%i<br /> set /A num+=1<br />)<br />if %num%==0 (<br /> echo No files found<br />) else (<br /> echo Files found:%num%<br />) |
| dir-B-findstr-Empty<br />ifDirEmpty | dir /B 文件夹路径 \| findstr . >nul && echo NoEmpty \|\| echo Empty                                                                                                          |
| cer-Add-Root                        | certutil -addstore Root 导入根证书路径                                                                                                                                       |

### 4. 通用模板

| 钩子                       | 代码                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ECHO_OFF-CWD               | @ECHO OFF<br />CD /D "%~dp0"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Bandizip -C                | CALL Bandizip.exe c 压缩到.zip "压缩目标"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| REG -s                     | CALL REG -s reg 文件路径                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| REG -import                | CALL REG import reg 文件路径                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| REG -Edit                  | echo start reg ...<br />:: 获取当前路径 并 设为变量 df<br />::set df=%~dp0<br />:: 强调显示变量 %df%<br />::echo %df%<br />:: 注册表中的应用<br />:: 注册表创建自启动项<br />:: Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "名称" /t REG_SZ /d "%df%路径" /f<br />:: 注册表删除自启动项<br />:: Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "名称" /f<br />:: Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f<br />::也可以不用变量直接写入<br />:: REG ADD "HKEY_CURRENT_USER\Software\illusion\RoomGirdmklin\RoomGirdmklin" /v "INSTALLDIR" /d "%~dp0\" /f<br />:: 路径“%~dp0”就是注册路径。 |
| Host -Edit                 | :: 取消 hosts 只读<br />attrib -R C:\WINDOWS\system32\drivers\etc\hosts<br />:: 用 记事本 打开 hosts <br />call notepad C:\WINDOWS\system32\drivers\etc\hosts<br />:: 设定 hosts 只读<br />attrib +R C:\WINDOWS\system32\drivers\etc\hosts                                                                                                                                                                                                                                                                                                                                                                                                                 |
| inno -Install              | InnoSetup 安装程序路径 /SILENT /COMPONENTS="InnoExtractor 提取的安装参数\_使用英文逗号隔开"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| msi -Install               | @REM msiexec /i [安装] "安装包路径" /qb [指定在安装过程中有一个基本 UI]<br />msiexec /i 安装包路径 /qb                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| msi -X<br />msi -Uninstall | @REM msiexec /x [卸载] "安装包路径" /qb [指定在安装过程中有一个基本 UI]<br />msiexec /x 安装包路径 /qb                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| bat-to-exe                 | :: bat_to_exe 嵌入式模板...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

### 5. 文件操作

| 钩子                                | 代码                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| md<br />mkdir                       | md 新建路径                                                                                                                                                                                                                                                                                                              |
| copy                                | copy /V /Y 复制路径 粘贴路径                                                                                                                                                                                                                                                                                             |
| xcopy                               | xcopy /S /E /I /Y 复制文件路径 粘贴路径                                                                                                                                                                                                                                                                                  |
| move                                | move /Y 目标路径 粘贴路径                                                                                                                                                                                                                                                                                                |
| ren                                 | ren 重命名的文件或文件夹路径 "新名称及后缀"                                                                                                                                                                                                                                                                              |
| del -Q                              | del /Q 删除文件路径                                                                                                                                                                                                                                                                                                      |
| rd -SQ                              | rd /S /Q 删除目录路径                                                                                                                                                                                                                                                                                                    |
| rmdir                               | rmdir 删除的空文件夹或符号链接路径                                                                                                                                                                                                                                                                                       |
| mklink                              | mklink 新文件路径 目标文件路径                                                                                                                                                                                                                                                                                           |
| mklink -D                           | mklink /D 新符号链接路径及名称 目标路径                                                                                                                                                                                                                                                                                  |
| mklink -J                           | mklink /J 新符号链接的路径及名称 目标路径                                                                                                                                                                                                                                                                                |
| del_Lnk<br />New_Lnk                | del /Q 新文件路径                                                                                                                                                                                                                                                                                                        |
| del_Lnk -H<br />New_Lnk -H          | del /Q 新文件路径<br />mklink /H 新文件路径 目标文件路径                                                                                                                                                                                                                                                                 |
| re_Lnk -D<br />New_Lnk -D           | rd /S /Q 新捷方式路径<br />mklink /D 新捷方式路径 目标路径                                                                                                                                                                                                                                                               |
| re_Lnk -J<br />New_Lnk -J           | rd /S /Q 新符号链接路径<br />mklink /J 新符号链接路径 目标路径                                                                                                                                                                                                                                                           |
| open -explorer                      | explorer.exe 打开文件夹路径                                                                                                                                                                                                                                                                                              |
| Desktop_Lnk -vbs<br />Shortcut -vbs | mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\快捷方式名称.lnk""):b.TargetPath="exe 绝对路径\_需要双引号包裹":b.Arguments=""--启动选项可选"":b.WorkingDirectory=""程序工作目录或起始位置"":b.IconLocation=""可选 ico 图标路径"":b.Save:close") |

### 6. 系统操作

| 钩子                   | 代码                            |
| ---------------------- | ------------------------------- |
| admin<br />UAC         | :: 判断获取管理员权限模板...    |
| kill -f<br />kill_safe | taskkill /F /IM "进程名称"      |
| kill -t<br />kill -all | taskkill /F /T /IM "进程名称"   |
| pause                  | PAUSE                           |
| pause -NUL             | PAUSE > NUL                     |
| start                  | start "窗口标题" "运行程序路径" |
| timeout                | timeout /t 等待秒数             |
| cmd -C                 | CMD /C 命令                     |

### 7. npm 功能

| 钩子      | 代码                                                                                                                                                                                                                                                                                                                       |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| help -npm | @REM npm 说明<br />临时代理 --registry https://registry.npm.taobao.org<br />配置参数:{<br /> -G 全局安装<br /> -S 局部安装的插件写入 package.json 文件中的 dependencie(默认)<br /> -D 局部安装的插件写入 package.json 文件中的 devDependencie<br /> -O 局部安装的插件写入 package.json 文件中的 optionalDependencie<br />} |

### 8. Python 功能

| 钩子                                    | 代码                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| py -venv                                | call python.exe -m venv \_venv<br />call \_venv\Scripts\activate                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| py -activate                            | call \_venv\Scripts\activate                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| pip -config.index                       | echo 清华<br />call pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple<br />call pip config set install.trusted-host https://pypi.tuna.tsinghua.edu.cn<br />echo 阿里<br />@REM call pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/<br />@REM call pip config set install.trusted-host https://mirrors.aliyun.com/pypi<br /><br />echo 豆瓣<br />@REM call pip config set global.index-url https://pypi.douban.com/simple/<br />@REM call pip config set install.trusted-host https://pypi.douban.com                                                                                                                                                                                                    |
| pip -install                            | call python.exe -m pip install 模块名\_whl 文件路径 -i https://pypi.tuna.tsinghua.edu.cn/simple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| pip -install.reinstall                  | call python.exe -m pip install --force-reinstall 模块名\_whl 文件路径 -i https://pypi.tuna.tsinghua.edu.cn/simple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| pip -upgrade                            | call python.exe -m pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| pip -uninstall                          | call python.exe -m pip uninstall 模块名 -y                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| pip -freeze                             | call python.exe -m pip freeze > requirements.txt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| pip -requirements<br />pip -txt.install | call python.exe -m pip install -r requirements.txt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| pip -Django                             | call python.exe -m pip install django -i https://pypi.tuna.tsinghua.edu.cn/simple<br />call django-admin.exe startproject **DjangoServer*BE* .<br />call python.exe manage.py startapp apps<br />@REM **Django 修改默认端口号与地址**<br />@REM manage.py : from django.core.management.commands.runserver import Command<br />@REM if **name** == '**main**':<br />@REM Command.default_port = '修改默认端口'<br />@REM main()<br />@REM \_\_**<br />@REM call python.exe manage.py makemigrations<br />@REM call python.exe manage.py migrate                                                                                                                                                                                                         |
| pip -DRF                                | call python.exe -m pip install django -i https://pypi.tuna.tsinghua.edu.cn/simple<br />call python.exe -m pip install djangorestframework -i https://pypi.tuna.tsinghua.edu.cn/simple<br />call python.exe -m pip install django-cors-headers -i https://pypi.tuna.tsinghua.edu.cn/simple<br />call django-admin.exe startproject **DjangoServer*BE* .<br />call python.exe manage.py startapp apps<br />@REM **Django 修改默认端口号与地址**<br />@REM manage.py : from django.core.management.commands.runserver import Command<br />@REM if **name** == '**main**':<br />@REM Command.default_port = '修改默认端口'<br />@REM main()<br />@REM \_\_**<br />@REM call python.exe manage.py makemigrations<br />@REM call python.exe manage.py migrate |
| pip -fastapi                            | @REM 安装 fastapi web 框架<br />call python.exe -m pip install fastapi -i https://pypi.tuna.tsinghua.edu.cn/simple<br />@REM 安装 uvicorn 异步服务器<br />call python.exe -m pip install uvicorn -i https://pypi.tuna.tsinghua.edu.cn/simple<br />@REM 安装 pydantic 数据接口定义检查与设置管理<br />call python.exe -m pip install pydantic -i https://pypi.tuna.tsinghua.edu.cn/simple<br />@REM 安装 pywebview webGUI 框架库<br />call python.exe -m pip install pywebview -i https://pypi.tuna.tsinghua.edu.cn/simple<br />@REM 安装 pyinstaller 打包工具<br />call python.exe -m pip install pyinstaller -i https://pypi.tuna.tsinghua.edu.cn/simple<br />...                                                                                      |
| pip -PyInstaller                        | call python.exe -m pip install pyinstaller -i https://pypi.tuna.tsinghua.edu.cn/simple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

### 9. vscodePlugin 插件创建

| 钩子     | 代码                      |
| -------- | ------------------------- |
| help -yo | :: vscode 插件开发模板... |

### 10. vue 功能

| 钩子                                           | 代码               |
| ---------------------------------------------- | ------------------ |
| vue -Install<br />vite -Install<br />init -vue | :: vue 开发模板... |

### 11. Git 功能

| 钩子                 | 代码                                                    |
| -------------------- | ------------------------------------------------------- |
| git user-config      | git config user.name ...<br />git config user.email ... |
| git sslverify-config | git config --global http.sslVerify false \| true        |

---

## Markdown

### 启用:

`settings.json` 中添加设置:

```json
"[markdown]": {
    "editor.quickSuggestions": {
        "other": "on",
        "comments": "on",
        "strings": "on"
    }
```

### 1. Markdown 标题语法

| 钩子 | 代码   |
| ---- | ------ |
| h1   | \#     |
| h2   | ##     |
| h3   | ###    |
| h4   | ####   |
| h5   | #####  |
| h6   | ###### |

### 2. Markdown 分隔线语法

| 钩子 | 代码         |
| ---- | ------------ |
| hr1  | \=\=\=\=\=\= |
| hr2  | \------      |
| hr3  | \*\*\*\*\*\* |

### 3. Markdown 链接语法

| 钩子       | 代码                                                            |
| ---------- | --------------------------------------------------------------- |
| a          | \[超链接显示名\(\'强调文字\'\)\]\(超链接地址 \"超链接 title\"\) |
| URL, email | \<网址和 Email 地址\>                                           |

### 4. Markdown 模板

| 钩子               | 代码                |
| ------------------ | ------------------- |
| mdHepl, mdTemplate | :: Markdown 模板... |

### 5. Markdown 强调语法

| 钩子                            | 代码                                |
| ------------------------------- | ----------------------------------- |
| Bold, strong                    | **\*\*boldText\*\***                |
| italic, em                      | \*\*italicText\*\*                  |
| Bold italic, Bold em, strong em | **\*\*\*\*bold_italicText\*\*\*\*** |

### 6. README 帮助文档

#### 6.1 **FastAPI** 帮助

| 钩子          | 代码                             |
| ------------- | -------------------------------- |
| help -FastAPI | :: **# FastAPIHelp** 帮助文档... |

#### 6.2 **VSCode** 帮助

| 钩子         | 代码                                        |
| ------------ | ------------------------------------------- |
| help -VSCode | :: **# VSCode Plugin 插件构建** 帮助文档... |

#### 6.3 **vue** 帮助

| 钩子      | 代码                              |
| --------- | --------------------------------- |
| help -vue | :: **# vue 初始设置** 帮助文档... |

---

## typescript

| 钩子                                    | 代码                                                                                                                              |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| axios -API                              | :: **# axios.API 配置** 帮助文档...                                                                                               |
| import-ElementPlus<br />im -ElementPlus | import ElementPlus from 'element-plus'<br />import 'element-plus/dist/index.css'<br />// createApp(App)<br />// .use(ElementPlus) |
| server -proxyAPI                        | :: **# server.proxyAPI 跨域代理** 帮助文档...                                                                                     |

---

## scss

| 钩子     | 代码                                   |
| -------- | -------------------------------------- |
| set -Btn | :: **# setBtn 自定义按钮样式** 文档... |

---

## python

#### 7.1 基础语法

`太多了...自己去发现吧...`

## 正在补全 ing...

---

**Enjoy!**
