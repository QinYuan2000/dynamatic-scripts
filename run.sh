set-dynamatic-path  ./dynamatic

set-clock-period 5.3

set-src             ./dynamatic/integration-test/fir/fir.c
# set-src             ./dynamatic/integration-test/iir/iir.c
# set-src             ./dynamatic/integration-test/gemver/gemver.c

compile

write-hdl

simulate

exit

