set-dynamatic-path ./dynamatic

set-clock-period 6

set-src ./dynamatic/integration-test/iir/iir.c

compile

write-hdl

simulate

exit
