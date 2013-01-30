function Link(Frontier[] bottoms, Frontier[] tops) {
    FrontierSection[] sections = {};
    
    foreach (Frontier b in bottoms) {
        // Sort grooves by X-coordinate (order not always defined!)
        b.Grooves.SortByXCoord();

        FrontierSection crtSection = new FrontierSection();
        
        for (int i = 0; i < b.Grooves.Count; ++i) {
            if (b.Grooves[i].NoBottom)
                continue;

            // null if no frontier
            Frontier f = ClosestFrontier(b.Grooves[i]);
            if (f == null)
                b.Grooves[i].IsEndRevolution = true;

            // New frontier to create
            if (f != crtSection.LinkedFrontier) {
                int linkedIndex = ClosestGrooveIndex(f, b.Grooves[i]);
                crtSection = new FrontierSection(b, f, i, 1, linkedIndex);
                sections.Add(crtSection);
            }
            else    // Just enlarge the section
                crtSection.AddGroove();
        }
    }
    
    return sections;
}
