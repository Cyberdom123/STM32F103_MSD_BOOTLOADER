add_library(stm32_usb_device STATIC
  Core/Src/usbd_core.c
  Core/Src/usbd_ctlreq.c
  Core/Src/usbd_ioreq.c

  Class/MSC/Src/usbd_msc_bot.c
  Class/MSC/Src/usbd_msc_data.c
  Class/MSC/Src/usbd_msc_scsi.c
  Class/MSC/Src/usbd_msc.c
)

target_link_libraries(stm32_usb_device
  PRIVATE
  stm32f1xxHal
)

target_compile_definitions(stm32_usb_device PUBLIC 
  USE_HAL_DRIVER 
  STM32F103xB
  $<$<CONFIG:Debug>:DEBUG>
)

target_include_directories(stm32_usb_device PUBLIC
  Core/Inc
  Class/MSC/Inc
)