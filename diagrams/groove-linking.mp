input metauml;

% Colors
iClass.foreColor := (223/255, 232/255, 244/255);

% Fonts
% other: bcrr8r, lmbo10, bcrb8r, t1xbsssc, tyxtt, cmtt12, cs-lmr10, cl-lmss10
iClass.iName.iFont.name := "cs-lmssbx10";
iClass.iAttributeStack.iPict.iFont.name := "cs-lmss10";
iClass.iAttributeStack.iPict.iFont.scale := 0.8;
iClass.iMethodStack.iPict.iFont.name := "cs-lmss10";
iClass.iMethodStack.iPict.iFont.scale := 0.8;
iPackage.iNameStack.iPict.iFont.name := "cs-lmssbx10";
iAssoc.iFont.name := "cs-lmss10";

%------------------------------------------------
% Define classes
%------------------------------------------------

%Class.interp("PolyInterpolation")
%    ()
%    ("+fitP()");

%Class.chunk("Chunk")
%    ("+Tops")
%    ("+TrackGrooves()");

Class.frontier("Frontier")
    ("+Grooves")
    ();
Class.frontiersec("FrontierSection")
    ()
    ("+BestMatching()", "+LinkGrooves()");

%Class.tracker("GrooveTracker")
%    ("+InterpolatedBorder")
%    ("+Track()");

Class.groove("GrooveSection")
    ("+Points", "+BottomFrontier")
    ();
Class.grooveprop("GrooveProperties")
    ()
    ();
Class.groovelinker("GrooveLinker")
    ()
    ("+MatchTraces()", "+BuildTracks()");
Class.track("LinkedTrack")
    ("+AddPoints()")
    ();

%interp.info.foreColor := (229/255, 229/255, 229/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    leftToRight(60)(frontiersec, frontier);
    topToBottom(40)(frontier, groove);
    topToBottom(40)(frontiersec, groovelinker, track);
    leftToRight(40)(groove, grooveprop);
    %topToBottom(40)(tracker, finder);
    
    %depthfinder.w = finder.e + (50, -30);
    %fitfinder.w = finder.e + (50, 30);
    %depthfinder.n = finder.s + (-40, -40);
    %fitfinder.n = finder.s + (40, -40);
    
    %leftToRight(60)(fitfinder, interp);
    
    % Draw
    drawObjects(frontiersec, frontier, groovelinker, groove, grooveprop, track);
    
    % Links
    clink(compositionUni)(groove, frontier);
    clink(compositionUni)(grooveprop, groove);
    clink(dependency)(groovelinker, frontier);
    clink(dependency)(groovelinker, frontiersec);
    clink(dependency)(groovelinker, track);
    item(iStereo)("<<create>>")(obj.e = .5[track.n, groovelinker.s]);
    
    clink(aggregationUni)(frontier, frontiersec);
    item(iAssoc)("Frontier")(obj.ne = frontier.w + (0, -6));
    item(iAssoc)("LinkedFrontier")(obj.ne = frontier.w + (0, -12));
    item(iAssoc)("2")(obj.se = frontier.w + (0, 6));

endfig;

end
