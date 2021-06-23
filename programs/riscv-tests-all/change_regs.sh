#!/bin/bash
sed -i 's/ x1 / t0 /g' $1
sed -i 's/ x1$/ t0/g' $1
sed -i 's/ x1,/ t0,/g' $1
sed -i 's/,x1,/,t0,/g' $1

sed -i 's/ x2 / t1 /g' $1
sed -i 's/ x2$/ t1/g' $1
sed -i 's/ x2,/ t1,/g' $1
sed -i 's/,x2,/,t1,/g' $1

sed -i 's/ x30 / t2 /g' $1
sed -i 's/ x30$/ t2/g' $1
sed -i 's/ x30,/ t2,/g' $1
sed -i 's/,x30,/,t2,/g' $1

sed -i 's/ x29 / t3 /g' $1
sed -i 's/ x29$/ t3/g' $1
sed -i 's/ x29,/ t3,/g' $1
sed -i 's/,x29,/,t3,/g' $1

sed -i 's/ x4 / t4 /g' $1
sed -i 's/ x4$/ t4/g' $1
sed -i 's/ x4,/ t4,/g' $1
sed -i 's/,x4,/,t4,/g' $1

sed -i 's/ x6 / t5 /g' $1
sed -i 's/ x6$/ t5/g' $1
sed -i 's/ x6,/ t5,/g' $1
sed -i 's/,x6,/,t5,/g' $1

sed -i 's/ x5 / t6 /g' $1
sed -i 's/ x5$/ t6/g' $1
sed -i 's/ x5,/ t6,/g' $1
sed -i 's/,x5,/,t6,/g' $1
