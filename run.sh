set-dynamatic-path ./dynamatic

set-clock-period 6

set-src ./dynamatic/integration-test/gaussian/gaussian.c

compile

write-hdl

simulate

exit
