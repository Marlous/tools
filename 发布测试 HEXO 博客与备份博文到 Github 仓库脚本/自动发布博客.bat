@echo off
rem @author：Marlous 2018/10/13
rem 脚本说明：自动发布博客脚本

rem ---设置---博客所在盘符，目录。
set disk=E:
set blogPath=E:\WorkZone\Repositories\my-blog

%disk%
cd %blogPath%

call  hexo clean
call  hexo g
call  hexo d

timeout /t 3