function(target_stlink_flash TARGET)
    add_custom_target(${TARGET}.flash_stlink
            openocd 
            -f ${CMAKE_SOURCE_DIR}/openocd.cfg
            -c "program ${CMAKE_SOURCE_DIR}/build/${TARGET}.elf reset exit"
            DEPENDS ${TARGET}
            COMMENT "Flashing target hardware"
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
endfunction(target_stlink_flash)