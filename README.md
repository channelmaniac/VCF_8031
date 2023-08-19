# 8031 Kit Computer for VCF Southwest
Welcome to the VCFSW 8031 Computer Build!

This PCB was designed for the show with a few goals in mind: 

•	Use a vintage CPU and easy to find parts
•	Reusable parts
•	Easy to build: No surface mount parts
•	Flexible power requirements
•	Easy to program
•	Easy to interface
•	Expandable

Most of these requirements were easy to meet. The PCB uses a simple 8 to 12v DC, 1A wall wart with a positive center barrel connector, but there was one surface mount connector as an option for those who wanted an alternate power jack to use +5v DC regulated. Using BASIC made it easier to accommodate novice programmers instead of requiring knowledge of assembly or machine code.

These processors and most of the parts are easily salvaged from other PCBs. A retro or homebrew build shouldn't be expensive! It works with 8031, 8032, 8051, or 8052 CPUs as it grounds the pin that would force the 805x CPUs to ignore their internal ROMs and boot the BASIC-52 1.2a from EPROM.

The unused pins of the microcontroller were brought out to a 20-pin header, labeled CN1, to make for easy expansion. The pins can do both input and output so their use is limited only by your imagination. Latches can be used to hold outputs at a fixed level, transistors can be used to switch larger loads such as relays, and optoisolators can be used to safely interface to the outside world. 

The expansion interface, labeled CN2, uses a 40-pin header and allows for additional circuitry to be connected to the address and data busses. It includes control signals and decoded chip selects at 8K boundaries to simplify interfacing to the microcontroller.

The computer runs BASIC-52 version 1.2a which was modified by Dan Karmann to run on the 8051 instead of the 8052 architecture which has some minor differences such as one less timer. The 803x/805x architecture is different from what you're probably used to. It has 64K of address space, but has separate 64K RAM and ROM address spaces. This code is not mine so it will not be on this repository but is easily found as a .hex file online. If your EPROM programmer does not support .hex files, you will need a utility to convert the file to binary. These programs may require DOSBox on your Windows PC to run.

---------

Computer ROM Memory Map:
0000-1FFFh - BASIC52 1.2a

Computer RAM Memory Map:
0000-7FFFh - RAM

---------

Add-on CamelForth 1.6 module (Planned... Separate from the computer build)

CamelForth is distributed under the GNU General Public License and can be found at: http://www.camelforth.com/page.php?4

Module ROM Memory Map:
2000-3FFFh - CamelForth 1.6

Computer Shared RAM Memory Map (Sits in both RAM and ROM space. This is required by the CamelForth software. It does not use the RAM from 0000-7FFFh.)
E000-EFFFh - Code RAM
F000-FDFFh - Data RAM
FE00-FFFFh - UPHI RAM

---------

These are a couple of helpful programs that I found while putting this together

1. A51 Assembler is an 8051 assembler that runs under MS-DOS. It was downloaded off the CamelForth web site at http://www.camelforth.com/page.php?4

When using it to change the starting address of the code from 0000 to 2000h, the .org 0 statement needed to be written as either .org 8192 or .org 0x2000 to be compiled to the proper starting addresses. If you use .org 2000 then it will write the code to start at 07D0h, which is 2000 in decimal! Yeah, I stumbled over this and got the answer from a nice Redditor. :)

The output of the assembler is in .hex file format. If your EPROM programmer does not support hex files, there are utilities available on the web to convert hex to bin (binary) files.

2. Tutor51 is a TSR program that can be called up with a quick Alt - Left Shift - T and displays programming tips for the 8051. It came on an old Shareware CD of programming tools. 

Neither will run under Windows 7, 8, or 10 natively, but will run on Windows 7, 8, or 10 inside the DOSBox environment.