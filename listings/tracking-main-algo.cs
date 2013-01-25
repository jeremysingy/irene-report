function Track(Point start) {
    Point[] points;

    for(int row = start.Y; row < nextStop; ++row) {
        points.Add(FindCenter());
        nextStop = FindStopPos();
    }
    
    return new Groove(points);
}