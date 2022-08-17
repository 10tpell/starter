cmake_minimum_required(VERSION 3.0.0)
project(Starter VERSION 0.1.0)

enable_language(C ASM)

add_executable(Starter src/startup.s src/main.c src/ISRs.c src/GPIO.c)

target_include_directories(Starter PUBLIC ./include)
target_compile_options(Starter PUBLIC -c -g -O0 -mcpu=cortex-m4 -Wall --specs=nosys.specs)
set(CMAKE_ASM_FLAGS "${CFLAGS} -x assembler-with-cpp")
target_link_options(Starter PUBLIC -mcpu=cortex-m4 -Wall -g --specs=nosys.specs -nostdlib -lgcc -T./linkerscript.ld -Wl,-Map=./build/Starter.map)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
