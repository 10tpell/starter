cmake -DCMAKE_TOOLCHAIN_FILE=./toolchain.cmake
make

# debug to run on gdb server:
# st-util (startsup gdb server)
# gdb-multiarch <elf-file>
# target extended-remote :4242 (connects to server)
# load (loads elf file onto target)
# continue (resumes cpu)