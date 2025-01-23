cmake_minimum_required(VERSION 3.22)

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

# Set target settings
set(MCU_FAMILY  STM32F1xx)
set(MCU_MODEL STM32F103XB)
set(CMAKE_PROJECT_NAME STM32f103_msd_bootloader)

string(TOLOWER ${MCU_MODEL} MCU_MODEL_LOWER)
string(TOLOWER ${MCU_FAMILY} MCU_FAMILY_LOWER)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

set(LINKER_SCRIPT_NAME STM32F103C8TX_FLASH.ld)

include(gcc-arm-none-eabi.cmake)

include(functions.cmake)

project(${CMAKE_PROJECT_NAME})

enable_language(C CXX ASM)

add_executable(${PROJECT_NAME}
  Src/main.c
  Src/aes.c
  Src/crc.c
  Src/crypt.c
  Src/fat32.c
  Src/ihex_parser.c
  Src/stm32f1xx_hal_msp.c
  Src/stm32f1xx_it.c
  Src/system_stm32f1xx.c
  Src/syscalls.c
  Src/sysmem.c
  Src/usb_device.c
  Src/usbd_conf.c
  Src/usbd_desc.c
  Src/usbd_storage_if.c

  startup_stm32f103c8tx.s
)

include_directories(
  Inc
)

# Add the HAL library
add_subdirectory(Drivers/STM32F1xx_HAL_Driver)
add_subdirectory(Middlewares/ST/STM32_USB_Device_Library)

target_link_libraries(${PROJECT_NAME}
  stm32f1xxHal
  stm32_usb_device
)

target_stlink_flash(${CMAKE_PROJECT_NAME})