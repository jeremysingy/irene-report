function FindFrontiers(float[] chunk, double deltaY) {
    int minIndex = x; // Index of left-mostpoint

    // Copy X coords from the left-most point and repeating the first one
    float[] pointsX = new float[Contour.Len + 1];

    for (int i = 0; i < Contour.Len + 1; ++i)
        pointsX[i] = Contour[(i + minIndex) % Contour.Len].X;

    // Find tops/bottoms transitions using peak detection
    int mins[], max[] = FindPeaks(pointsX, MIN_LENGTH);

    // First bottom (always)
    AddNewFrontier(0, maxs[0], minIndex, false);

    // Mid tops/bottoms (if existing)
    for (int i = 0; i < maxs.Len - 1; ++i)
    {
        AddNewFrontier(maxs[i], mins[i], minIndex, true);
        AddNewFrontier(mins[i], maxs[i + 1], minIndex, false);
    }

    // Last top (always)
    AddNewFrontier(maxs[maxs.Len - 1], pointsX.Len - 1, minIndex, true);
}

function AddNewFrontier(int first, int last, int minIndex, bool isTop) {
    List<Point> frontier = new List<Point>();

    // Copy points
    for (int i = first; i <= last; ++i)
        frontier.Add(Contour[(i + minIndex) % Contour.Len]);
    
    // Add frontier if large enough
    if (abs(frontier.Last().X - frontier[0].X) > MIN_X_FRONTIER) {
        if (isTop) {
            frontier.Reverse();
            tops.Add(frontier);
        }
        else
            bottoms.Add(frontier);
    }
}