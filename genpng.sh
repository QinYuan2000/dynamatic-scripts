# benchmark="fir"
benchmark="bicg"

cd /home/yuaqin/dynamatic-scripts/dynamatic/integration-test/$benchmark/out/comp
dot -Tpng $benchmark.dot -o ${benchmark}2.png
cd ~/dynamatic-scripts/