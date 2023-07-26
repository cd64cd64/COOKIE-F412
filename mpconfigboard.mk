MCU_SERIES = f4
CMSIS_MCU = STM32F412Rx
AF_FILE = boards/stm32f412_af.csv
LD_FILES = boards/stm32f412.ld boards/common_ifs.ld
TEXT0_ADDR = 0x08010000
TEXT1_ADDR = 0x08024000

# MicroPython settings
MICROPY_VFS_LFS2 = 1
