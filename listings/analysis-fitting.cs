function FittedSignal(float[] rawImg, int start, int length) {
    double[] signalRes = {};
    int startRow = groove.Points[start].Y * binFact;
    int endRow = Min(groove.Points.Last().Y * binFact, startRow + length);

    for (int j = startRow; j < endRow; ++j)
    {
        int binPosX = groove.Points[(j - startRow) / binFact + start].X;
        int left = binPosX - FIT_WIDTH;
        int right = binPosX + FIT_WIDTH;
        double[] valuesX = new double[right - left + 1];
        double[] valuesH = new double[right - left + 1];

        // Get the line X and height
        for (int w = 0; w <= right - left; ++w)
        {
            valuesX[w] = w + left;
            valuesH[w] = rawImg[j * hardware.Width + w + left];
        }

        // Fit parabola
        double[] par = PolyInterpolation.fitP(valuesX, valuesH, valuesX.Length, Constants.ORDER_PARAREG);
        double topX = -par[1] / (2 * par[2]);

        // Default: tracked value
        double finalValue = rawImg[j * hardware.Width + binPosX];

        // If appropriate, fitted value
        if (par[2] > 0 && Math.Abs(topX - binPosX) <= FIT_WIDTH)
            finalValue = par[2] * topX * topX + par[1] * topX + par[0];

        signalRes.Add(finalValue);
    }

    return signalRes;
}