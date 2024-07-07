set-dynamatic-path ./dynamatic

set-clock-period 6

set-src ./dynamatic/integration-test/fir/fir.c

compile

write-hdl

simulate

exit
