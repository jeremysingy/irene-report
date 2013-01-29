function LinkFrontier(Frontier[] tops, Frontier[] bottoms) {
    // Link grooves together between cracks from the selected shifts
    foreach (var f in bottoms)
        foreach (var s in f.Sections)
            s.LinkGrooves();

    // Find and sort starting grooves, not detailed here
    GrooveSection[] startGrooves = FindStartGrooves(tops, bottoms);
    startGrooves.SortByXCoord();

    // Follow tracks and return them
    return FindTracks(startGrooves);
}

function FindTracks(GrooveSection[] startGrooves) {
    LinkedTrack[] tracks = {};
    LinkedTrack crtTrack = new LinkedTrack();

    foreach (var groove in startGrooves) {
        crtTrack.AddPoints(groove.Points);
        GrooveSection crtGroove = groove;

        while (crtGroove.NextGroove != null) {
            crtTrack.AddPoints(crtGroove.NextGroove.Points);
            crtGroove = crtGroove.NextGroove;
        }

        // Not in the end of a revolution, start a new track
        if (!crtGroove.IsEndRevolution) {
            tracks.Add(crtTrack);
            crtTrack = new LinkedTrack();
        }
    }

    // Add last track if any
    if (crtTrack.NbPoints > 0)
        tracks.Add(crtTrack);

    return tracks;
}