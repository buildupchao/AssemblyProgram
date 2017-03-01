# AssmblyProgram
基于LC-3实现的汇编语言程序

## Contents:
- Bubble Sort
- Hanoi
- Interrupt-Driven I/O

## 冒泡排序

- 实现原理
a) 算法核心（这个是我如此分配的，如果有不认可的地方，请指出）
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as1-1.png)

b) 主存和寄存器的使用情况
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as1-2.png)

c) 二进制与字符转换图示
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as1-3.png)

- [冒泡排序算法核心代码](https://github.com/Zychaowill/AssmblyProgram/blob/master/Assmebly%20Program/BubbleSort/bubbleSort)

- [冒泡排序检测数据代码](https://github.com/Zychaowill/AssmblyProgram/blob/master/Assmebly%20Program/BubbleSort/DATA)

## 汉诺塔

该汇编程序是通过栈实现的。该汉诺塔只有三个塔座，分别为S（Start）, T（Temp）, E（End）。

- 思想分析
先把 S 底座上前（n - 1）个塔盘通过 E 底座移动到 T 底座上上，再把 S 底座上剩下的第n个塔盘移动到 E 底座上，然后再把临时放到 T底座上的（n - 1）个塔盘移动到 E 底座上，即OK。
然而，这个只是在代码实现上的逻辑简化，现实中是不能这样在底座上移动底盘的。在正常操作时，只能一次移动一个底盘，而且移动过程中不能出现大底盘在小底盘上的情况。

- 代码详解
a) 算法核心
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-1.png)

b) 栈初始化
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-2.png)

c) 输入塔盘数n
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-3.png)

d) 保存寄存器内容，进行检测n值是否合法
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-4.png)

e) Move S to E，如果只有一块底盘时，直接移动S底座上的唯一一个塔盘到E底座上即可
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-5.png)

f) 如果n > 1，则Move (n - 1, S, E, T)
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-6.png)

g) Move nth from S to E
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-7.png)

h) Move (n - 1, T, S, E)
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-8.png)

i) 恢复寄存器中的内容，与第d步骤对应
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as2-9.png)

- [汉诺塔代码实现](https://github.com/Zychaowill/AssmblyProgram/blob/master/Assmebly%20Program/Hanoi/hanoi)

## 中断驱动的IO模拟

- 中断驱动的IO图示分析
a) 主存映射的IO图：
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as3-1.png)

b) 中断驱动的IO使用的设备寄存器（此处显示的是键盘寄存器：键盘数据寄存器KBDR和键盘状态寄存器KBSR）
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as3-2.png)

c) 应为要模拟终端驱动的IO，所以首先要构造中断矢量表条目，即中断处理程序入口地址指针
![](https://raw.githubusercontent.com/Zychaowill/ImgStore/master/AssmblyProgram/as3-3.png)

中断驱动的IO汇编模拟程序，主要有两部分组成：

- [用户程序](https://github.com/Zychaowill/AssmblyProgram/blob/master/Assmebly%20Program/Interrupt_new/INT)

- [中断处理程序](https://github.com/Zychaowill/AssmblyProgram/blob/master/Assmebly%20Program/Interrupt_new/INTP)
