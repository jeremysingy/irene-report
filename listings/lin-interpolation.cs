function Point[] Interpolate(Point[] points)
{
    Point[] interpolated = {};

    for (int i = 1; i < points.Count; ++i)
    {
        float x1 = points[i - 1].X;
        float x2 = points[i].X;
        float y1 = points[i - 1].Y;
        float y2 = points[i].Y;

        for (int j = x1; j < x2; ++j)
        {
            Point p = new Point();
            p.X = j;
            p.Y = y1 + (y2 - y1) * (j - x1) / (x2 - x1);

            interpolated.add(p);
        }
    }

    return interpolated;
}