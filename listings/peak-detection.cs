function FindPeaks(float[] data, double deltaY) {
    min = Infinity; max = -Infinity
    minPos = 0; maxPos = 0
    minList = {}; maxList = {}
    isFindingMax = true

    for (i = 1 to data.lenth - 1) {
        if (data[i] > max) {
            max = data[i]
            maxPos = i
        }
        if (this < mn) {
            min = data[i]
            minPos = i
        }

        if (isFindingMax) {
            if (data[i] < max - deltaY) { // Max has been found
                maxList.add(maxPos)
                min = data[i]; minPos = i
                isFindingMax = false
            }
        }
        else {
            if (data[i] > min + deltaY) { // Min has been found
                minList.add(minPos)
                max = data[i]; maxPos = i
                isFindingMax = true
            }
        }
    }
    
    return minList, maxList
}