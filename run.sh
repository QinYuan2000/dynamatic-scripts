set-dynamatic-path ./dynamatic

set-clock-period 6

set-src ./dynamatic/integration-test/kernel_2mm/kernel_2mm.c

compile

write-hdl

simulate

synthesize

exit
