# Computer_Organization<img src="https://github.com/shawnco411/Data_Structure/blob/master/shawnco4111.png" width="6%" align="right">
计算机组成课程设计

## 项目介绍

该项目包含了计算机组成课程设计的多次项目（MIPS汇编程序设计、Logisim单周期CPU、Verilog单周期CPU、Verilog流水线CPU）代码以及设计文档。

其中流水线CPU满足以下要求：

* 流水线CPU的顶层视图参考下图：

<img src="https://github.com/shawnco411/Computer_Organization/blob/master/pipeline_doc/pipeline.png">

* 支持MIPS-lite2指令集。

&ensp;&ensp;&ensp;&ensp;MIPS-lite2={ addu, subu, ori, lw, sw, beq, lui, j, jal, jr, nop }

* 控制器与冲突单元(上图中的 Hazard Unit)分离，即定义了独立的 controller 模块和 hazard 模块。

* 已尽最大可能支持转发以解决数据冒险，通过减少指令的总周期数充分提升了处理器的性能。

* 对于 b 类和 j 类指令， 流水线设计支持延迟槽。

*  指令存储器(IM，instruction memory)和数据存储器(DM，data memory)满足以下要求：

&ensp;&ensp;&ensp;&ensp;IM：容量为4KB(32bit/word×1024word)。

&ensp;&ensp;&ensp;&ensp;DM：容量为4KB(32bit/word×1024word)。

* PC的初始地址为0x0000_3000。

* 为了解决数据冒险而设计的转发数据来源为某级流水线寄存器，不允许对功能部件的输出直接进行转发，由此避免流水线各阶段延迟不均衡导致流水线性能严重下降（木桶原理）。

* 对数据冲突和分支冲突进行充分测试，考虑到所有可能会产生冲突的各种指令的组合。

## 文件介绍

|----`Logisim单周期CPU设计文档.pdf`主要包含Logisim单周期CPU的模块规格、控制器设计、测试程序三方面的内容。

|----`Verilog单周期CPU设计文档.pdf`主要包含Verilog单周期CPU的数据通路设计、控制器设计、测试程序三方面的内容
 
|----`/MARS project`目录下为历次MIPS汇编程序设计的代码。运行环境：[MARS 4.5](http://www.cs.missouristate.edu/~vollmar/MARS/download.htm "MARS 4.5") 
 
|----`/mypipeline`目录下为Verilog流水线CPU的代码。运行环境：[ISE Design Suite 14.7 ](https://china.xilinx.com/support/download/index.html/content/xilinx/zh/downloadNav/design-tools.html "ISE Design Suite 14.7 ")
 
|----`/pipeline_doc`目录下为Verilog流水线CPU开发的相关文档，分别为：
 
|------------`Bypass.xlsx`为旁路转发分析表格。
 
|------------`P5Signals.xlsx`对不同指令所产生的信号进行了分析。
 
|------------`P5TnewTuse.xlsx`为数据冒险分析表格。
 
|------------`Verilog流水线CPU设计文档.pdf`，主要包含数据通路中各部件的接口定义及功能、测试程序这两方面的内容。
 
|------------`datapath.xlsx`为数据通路分析表格。
 
 ## 开源协议

[GNU General Public License v3.0](LICENSE)
