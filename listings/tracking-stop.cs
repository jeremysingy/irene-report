function FindStopPos(...) {
    int nextStop = int.MaxValue;
    Frontier frontierStop;

    // Test the next frontier to stop at
    foreach (Frontier b in bottoms) {
        int height = b.HeightFromX(crtX);

        if (height > 0 && height / binFactor >= row && height < nextStop) {
            nextStop = height;
            frontierStop = b;
        }
    }

    return nextStop, frontierStop;
}