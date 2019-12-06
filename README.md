# MIPS_processor
A MIPS_processor in Verilog.
Course assignments.
We only implement some simple instrutions,such as add,stl,addi,ori,beq,jump.

MIPS.docx是课程设计里的C语言和汇编语言部分，其中汇编语言分为三种，第三种代码量最少。
“汇编.txt”是MIPS.docx里的汇编语言部分，mips3_3.txt是“汇编.txt”的第三部分。
a2m_v2.py是将汇编语言翻译成机器语言的脚本；clean_blank.py用于清除一些多余的空格、回车、注释。这两部分比较专用，如想测试处理器也可以使用其他办法自行生成MIPS机器码。
mips3.txt是测试所用的机器码，是用mips3_3.txt经过两个脚本a2m_v2.py和clean_blank.py产生的。
实现了课程设计所要求的功能。运行single_cycle中的MIPS_test时，需要将mips3.txt放在同一文件夹下。

流水线结构实现了常用的数据冒险检测及前递。寄存器结构冒险通过在上升沿存寄存器解决；存储器结构冒险通过分离数据和指令存储器解决。lw/sw数据冒险未解决，需要在汇编中注意。jump控制冒险通过快速改变PC解决；beq需要在汇编中添加三个周期的nop，以防控制冒险。
mipspip.txt是流水线结构所用的机器码，相比于mips3.txt加了一些nop，以防beq控制冒险。运行pipeline中的MIPS_test时，需要将mipspip.txt放在同一文件夹下。

假设流水线比单周期处理器的时钟快了四倍，通过运行mipspip.txt，我们测得流水线结构总运算速度为单周期的两倍多。
