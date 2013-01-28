function ClosestFrontier(GrooveSection groove) {
    int minDistY = int.MaxValue;
    Frontier found = null;
    
    foreach (Frontier t in topFrontiers) {
        int height = t.HeightFromX(groove.End.X);
        int distY = height - groove.End.Y;

        if (height > 0 && distY >= -MAX_NEG_DIST && distY < minDistY) {
            minDistY = distY;
            found = t;
        }
    }

    return found;
}