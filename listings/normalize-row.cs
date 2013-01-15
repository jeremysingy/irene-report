function NormalizedRow(float[,] binImage, int row, float maxMagnitude) {
    float[] res
    
    // Copy data
    for(int i = 0; i < width; ++i)
        res[i] = binImage[row, i];

    float maxs[width];
    float[] mins;

    // Populate mins and maxs with the extremums for
    // each scan (every 180 points)
    // for(...) {...}
    
    for (int i = 0; i < width; ++i)
    {
        int crtId = i / 180;
        res[i] = (res[i] - mins[crtId]) / (maxs[crtId] - mins[crtId]) * maxMagnitude;
    }

    return res;
}