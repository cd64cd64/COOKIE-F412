## How to build micropython need ubuntu or Win10 subsystem Linux

git clone https://github.com/micropython/micropython.git
cd micropython
git submodule update --init
cd mpy-cross
make -j4
cd ../ports/stm32/boards
git clone https://github.com/cd64cd64/COOKIE-F412R.git COOKIE
cd ..
make

因为F4BOOTLOADER占用了32kb，所以要在0x08000000之后留出bl的空间，以防被覆盖
    FLASH (rx)      : ORIGIN = 0x08010000, LENGTH = 512K-48k /* entire flash 0,1,2sectors（16k+16k+16k） for bl*/
    FLASH_ISR (rx)  : ORIGIN = 0x08010000, LENGTH = 16K /* sector 3 16k 0x08010000--0x08013FFF*/
    FLASH_FS (rx)   : ORIGIN = 0x08014000, LENGTH = 64K /* sectors 4: 64k 0x08014000--0x08023FFF*/
    FLASH_TEXT (rx) : ORIGIN = 0x08024000, LENGTH = 384K /* sectors 5,6,7 are 128K 0x0802400--*/
    RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 240K
    FS_CACHE (xrw)  : ORIGIN = 0x2003c000, LENGTH = 16K
同步需要修改
TEXT0_ADDR = 0x08010000
TEXT1_ADDR = 0x08024000
