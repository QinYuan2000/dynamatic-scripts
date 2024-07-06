set-dynamatic-path ./dynamatic

set-clock-period 6

set-src ./dynamatic/integration-test/gcd/gcd.c

compile

write-hdl

simulate

exit
