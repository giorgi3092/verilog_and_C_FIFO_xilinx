onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib PS_BRAM_BD_opt

do {wave.do}

view wave
view structure
view signals

do {PS_BRAM_BD.udo}

run -all

quit -force
