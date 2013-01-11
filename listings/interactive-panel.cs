transformation.}, label={lst:inttransfo}]
// Start all drawing at the panel center and tip of the red triangle
g.TranslateTransform(this.Width / 2, trianglePos.Size.Height);

// Save this base system
Matrix savedTransform = g.Transform;

// Coordinate system transformation
g.TranslateTransform(this.Width / 2, trianglePos.Size.Height);
g.ScaleTransform(zoomLevel, zoomLevel);

// Draw the record bitmap
Point renderPos = new Point(-position.X, -position.Y);
g.DrawImage(bmpRecord, renderPos);

// Set the translation transformation for the tracked points
g.TranslateTransform(-position.X, -position.Y);

// Draw tracked points...

g.Transform = savedTransform;

// Draw red triangle (no transformation needed)
trianglePos.Draw(g);

// Transformation for the blue triangle position
Matrix m = new Matrix();
m.Translate(this.Width / 2, 0);
m.Scale(zoomLevel, zoomLevel);
m.Translate(-position.X, 0);

Point[] trackPos = new Point[]{new Point(TrackedGrooveX, 0)};
m.TransformPoints(trackPos);

// Draw the blue triangle at right position
triangleTrack.TargetPosition = trackPos[0];
triangleTrack.Draw(g);
g.Transform = savedTransform;