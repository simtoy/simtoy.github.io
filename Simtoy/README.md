Simtoy·模拟程序语言
=================================
![](https://img.shields.io/badge/SIMTOY-Programming%20language-red.svg)

纯粹为了理解与好玩,他所实现的操作有:
* 流程(Process)
* 字典(Dictionary)
* 函数(Function)
* 列表(Array)
* 类(Class)
# 源码
该Simulator由Perl开发而成, 您可以[查看源码](src.md)
# 文档
语法不免有些奇怪(因为所有操作都以**函数**实现)

[漫读SIMTOY的语法](document.md)
# 解释器下载
[下载(Windows系统)](https://dev-076.baidupan.com/2019/07/23/8ddeced42c6c1cb71dca045c70f6a423.zip?k=9f9362be1f3c347cbfd97f64c93600a3&t=1563857047&q=simtoy.zip)

[下载(Linux/UNIX系统)](https://simtoy.github.io/Simtoy/simtoy.pl)

打开文件后, 将您写好的脚本文件拖入黑框框(控制台)当中, 按下回车, 即可看到执行结果... **注意: Windows用户在使用Simtoy.exe的目录下务必要带有perl58.dll和lib.zip文件, 否则无法执行!**
# 例程
※**Hello World**
```
output("Hello, world!").
```
※**遍历2000年到3000年之间的所有闰年**
```
repeat(2000 to 3000 by 1 in year)
if(isLeap(year))->output(year)->end
end
```
※**调用以列表里的值为函数名的函数**
```
lt(names has "dog","cat","fish","duck")
fn(dog)->output("Woooof!")->end
fn(cat)->output("Meow!")->end
fn(fish)->output("Kurukuru!")->end
fn(duck)->output("Kakaka!")->end
each(names in name)->go(name)->end
```
And so on...
