@echo off
rem @author：Marlous 2018/11/02
rem 脚本说明：遍历某一个文件夹内容生成 txt 文件。要求从命令行输入文件夹路径和名字。

rem ---自动设置---文件夹所在盘符和文件夹路径
set /p documentPath=Please enter document path:
set /p documentName=Enter generated file name:

set disk=%documentPath:~0,2%

rem ---执行脚本---
%disk%

cd %documentPath%

rem 获取系统时间变量，年月日 yyyy/mm/dd，第一个数字为起始，第二个为长度。
set yyyy=%DATE:~0,4%
set mm=%DATE:~5,2%
set dd=%DATE:~8,2%

rem 有同名文件 list.txt 先删除。
if exist auto_generate_list.txt del "%documentName%_list_%yyyy%%mm%%dd%.txt"

tree %documentPath% /F >templista.txt

set count=0

rem 忽略前五行，计算行数并追加。删除包含 ECHO 的那行。删除两个临时文件
for /f "skip=5 tokens=1 delims=." %%c in (templista.txt) do (
	@set /a count += 1
	@echo %%c >>templistb.txt
)

echo Total:%count% >>templistb.txt

findstr /v "ECHO" templistb.txt >%documentName%_list_%yyyy%%mm%%dd%.txt

del "templista.txt"
del "templistb.txt"