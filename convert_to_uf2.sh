#!/bin/sh

arm-eabi-objcopy -O binary obj_target/shoot_n_loot.elf obj_target/shoot_n_loot.bin

wget https://raw.githubusercontent.com/microsoft/uf2/master/utils/uf2conv.py

python2 uf2conv.py -b 16384 -c -o shoot_n_loot.uf2 obj_target/shoot_n_loot.bin
