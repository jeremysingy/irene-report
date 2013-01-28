function RemoveOutliers(double[] data, double tolFactor) {
    if (data.Length == 0)
        return;

    double avg = data.Average();
    double[] deltas = new double[len];

    // Compute deltas from average
    for (int i = 0; i < len; ++i)
        deltas[i] = Math.Abs(data[i] - Avg);

    double avgDelta = deltas.Average();

    // Clean signal by comparing delta values
    for (int i = 0; i < len; ++i) {
        if (deltas[i] > tolFactor * avgDelta) {
            if (i > 0 && i < len - 1)
                data[i] = (data[i - 1] + data[i + 1]) / 2;
            else if (i > 0)
                data[i] = data[i - 1];
            else if (i < len - 1)
                data[i] = data[i + 1];
        }
    }
}