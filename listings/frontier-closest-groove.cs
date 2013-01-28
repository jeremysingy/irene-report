// Get the index of the closest groove to be linked to the next one with with a shift of 0
function ClosestGrooveIndex(Frontier frontier, GrooveSection groove) {
    int minDist = int.MaxValue;
    int minIndex = 0;

    if (frontier == null)
        return -1;

    for(int i = 0; i < frontier.Grooves.Count; ++i) {
        int xDist = Abs(frontier.Grooves[i].Start.X - groove.End.X);
        
        if(xDist < minDist) {
            minDist = xDist;
            minIndex = i;
        }
    }

    return minIndex;
}