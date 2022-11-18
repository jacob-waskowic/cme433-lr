exactVals = []
approxVals = []

valueFile = open("values.txt")
for line in valueFile:
    values = line.split(",")
    exactVals.append(int(values[3]))
    approxVals.append(int(values[2]))

diff = [abs(exactVals[i] - approxVals[i]) for i in range(len(exactVals))]
meanDiff = sum(diff) / len(diff)
print(meanDiff / (16129*3))