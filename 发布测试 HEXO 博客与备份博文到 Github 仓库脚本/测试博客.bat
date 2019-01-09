@echo off
rem @author：Marlous 2018/10/13
rem 脚本说明：测试 HEXO 博客，自动打开浏览器。

rem ---设置---博客所在盘符，目录。
set disk=E:
set blogPath=E:\WorkZone\Repositories\my-blog

%disk%
cd %blogPath%

start hexo server

rem ---设置---测试地址，火狐浏览器所在目录,路径有空格用引号包裹，防止误认为多个参数。
rem set testPath=http://localhost:4000/

rem 等待 3 秒。
rem timeout /t 3

rem set browsePath="D:\Program Files\Mozilla Firefox\firefox.exe"
rem start %browsePath% %testPath%