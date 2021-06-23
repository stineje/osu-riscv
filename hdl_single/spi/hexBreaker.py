lineList = [line.rstrip('\n\r') for line in open("readIn.txt")]
n = 2
splitHex = []
for x in lineList:
        for index in range(0, len(x), n):
                if x == 0:
                        splitHex.append(00)
                else:
                        splitHex.append(x[index : index + n])
                        

print(len(splitHex))

for x in range (len(splitHex), 16777216):
        splitHex.append('00');

print(len(splitHex)*8)
            
with open('firmware2.hex', 'w') as f:
    for item in splitHex:
        f.write("%s\n" % item)






