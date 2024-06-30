#!/bin/bash

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"

west build -s zmk/app -p -b nice_nano_v2 -- -DSHIELD="Keiler_left" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_left.uf2"

west build -s zmk/app -p -b nice_nano_v2 -- -DSHIELD="Keiler_right" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_right.uf2"

west build -s zmk/app -p -b seeeduino_xiao_ble -- -DSHIELD="Keiler_dongle" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_dongle.uf2"

west build -s zmk/app -p -b nice_nano_v2 -- -DSHIELD="settings_reset" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_nn_reset.uf2"

west build -s zmk/app -p -b seeeduino_xiao_ble -- -DSHIELD="settings_reset" -DZMK_CONFIG="${PWD}/config"
cp build/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}_xia_reset.uf2"