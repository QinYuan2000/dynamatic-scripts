set-dynamatic-path ./dynamatic

set-clock-period 4

set-src ./dynamatic/integration-test/matrix/matrix.c

compile

write-hdl

simulate

synthesize

exit
