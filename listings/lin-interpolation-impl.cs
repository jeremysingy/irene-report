public static List<Point> Interpolate(List<Point> points, bool keepPointUp)
{
    // Key: X-coordinate, Value: Point
    SortedDictionary<int, Point> interpolated = new SortedDictionary<int, Point>();

    for (int i = 1; i < points.Count; ++i)
    {
        float x1 = points[i - 1].X; float x2 = points[i].X;
        float y1 = points[i - 1].Y; float y2 = points[i].Y;
        int xDiff = (int)x2 - (int)x1;

        if (xDiff == 0)
            continue;

        for (int j = 0; j < xDiff; ++j)
        {
            int xVal = (int)x1 + j;

            Point p = new Point();
            p.X = xVal;
            p.Y = (int)(y1 + (y2 - y1) * (xVal - x1) / (x2 - x1));

            if (interpolated.ContainsKey(p.X))
            {
                // Add if upper and we want it or if lower and we want it
                if (keepPointUp == p.Y < interpolated[p.X].Y)
                    interpolated[p.X] = p;
            }
            else
                interpolated[p.X] = p;
        }
    }

    // Return the values (points) as a list
    return new List<Point>(interpolated.Values);
}