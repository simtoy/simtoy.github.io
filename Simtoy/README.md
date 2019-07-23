Simtoy·模拟程序语言
=================================
![](https://img.shields.io/badge/SIMTOY-Programming%20language-red.svg)

![](https://img.shields.io/badge/SIMTOY-Document-yellowgreen.svg)

![](https://img.shields.io/badge/SIMTOY-Source-orange.svg)

![](https://img.shields.io/badge/SIMTOY-Download-green.svg)

纯粹为了理解与好玩,他所实现的操作有:
* 流程(Process)
* 字典(Dictionary)
* 函数(Function)
* 列表(Array)
* 类(Class)

# 文档
语法不免有些奇怪(因为所有操作都以**函数**实现)

[漫读SIMTOY的语法](document.md)
# 解释器下载
[下载(Windows系统)](https://dev-076.baidupan.com/2019/07/23/8ddeced42c6c1cb71dca045c70f6a423.zip?k=9f9362be1f3c347cbfd97f64c93600a3&t=1563857047&q=simtoy.zip)

[下载(Linux/UNIX系统)](simtoy.pl)

打开文件后, 将你写好的脚本文件拖入黑框框(控制台)当中, 按下回车, 即可看到执行结果... **注意: Windows用户在使用Simtoy.exe的目录下务必要带有perl58.dll和lib.zip文件, 否则无法执行!**
# 例程
**Hello World**
```
Bark(<Hello world!>)
```
**遍历2000年到3000年之间的所有闰年**
```
say(year,2000) :设置year的初始值为2000
cy(3000,year,1)
sin(isLeap(&year))->bark({&year, is leap})->nis.
yc.
```
**调用以列表里的值为函数名的函数**
```
cab(Ani,dog,cat,fish,pig,duck) :创建叫'Ani'的列表并赋值
pro(dog)->bark(wooof...)->orp.
pro(cat)->bark(meow...)->orp.
pro(fish)->bark(kurukuru...)->orp.
pro(pig)->bark(nnng...)->orp.
pro(duck)->bark(gha...)->orp.
ec(Ani,temp)->go(&temp)->ce. :循环调用以列表里的值为函数名的函数
```
And so on...
