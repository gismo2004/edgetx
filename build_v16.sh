cd build
cmake -Wno-dev -DPCB=X10 -DPCBREV=V16 -DDEFAULT_MODE=2 -DBLUETOOTH=YES -DCMAKE_BUILD_TYPE=Release ../
make arm-none-eabi-configure
make -C arm-none-eabi -j`nproc` firmware
