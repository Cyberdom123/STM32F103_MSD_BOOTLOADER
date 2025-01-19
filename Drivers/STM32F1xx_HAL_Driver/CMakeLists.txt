add_library(stm32f1xxHal STATIC    
    Src/stm32f1xx_hal.c
    Src/stm32f1xx_hal_cortex.c
    Src/stm32f1xx_hal_dma.c
    Src/stm32f1xx_hal_flash.c
    Src/stm32f1xx_hal_flash_ex.c
    Src/stm32f1xx_hal_gpio.c
    Src/stm32f1xx_hal_gpio_ex.c
    Src/stm32f1xx_hal_pcd.c
    Src/stm32f1xx_hal_pcd_ex.c
    Src/stm32f1xx_hal_pwr.c
    Src/stm32f1xx_hal_rcc.c
    Src/stm32f1xx_hal_rcc_ex.c
    Src/stm32f1xx_hal_tim.c
    Src/stm32f1xx_hal_tim_ex.c
    Src/stm32f1xx_ll_exti.c
    Src/stm32f1xx_ll_gpio.c
    Src/stm32f1xx_ll_rcc.c
    Src/stm32f1xx_ll_usb.c
    Src/stm32f1xx_ll_utils.c
)

target_compile_definitions(stm32f1xxHal PUBLIC 
    USE_FULL_LL_DRIVER
	USE_HAL_DRIVER 
	STM32F103xB
    $<$<CONFIG:Debug>:DEBUG>
)

target_include_directories(stm32f1xxHal PUBLIC
    Inc
    Inc/Legacy
    ../CMSIS/Device/ST/STM32F1xx/Include
    ../CMSIS/Include
)