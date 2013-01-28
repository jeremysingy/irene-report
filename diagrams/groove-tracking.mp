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

%Class.misc("Misc")
%    ()
%    ("+FindPeaks()", "+FilterGrooveBottoms()");

Class.interp("PolyInterpolation")
    ()
    ("+fitP()");

Class.chunk("Chunk")
    ("+Tops")
    ("+TrackGrooves()");

Class.frontier("Frontier")
    ("+Grooves")
    ();

Class.tracker("GrooveTracker")
    ("+InterpolatedBorder")
    ("+Track()");

Class.finder("AbstractBottomFinder")
    ()
    ("+FindBottom()");
Class.depthfinder("DepthFinder")
    ()
    ("+FindBottom()");
Class.fitfinder("FitFinder")
    ()
    ("+FindBottom()");

Class.groove("GrooveSection")
    ("+Points", "+BottomFrontier")
    ();

interp.info.foreColor := (229/255, 229/255, 229/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    %topToBottom(40)(misc, chunk);
    topToBottom(40)(groove, tracker);
    topToBottom(40)(frontier, chunk);
    %leftToRight(60)(chunk, frontier, tracker);
    leftToRight(40)(finder, tracker, chunk);
    %topToBottom(40)(tracker, finder);
    %depthfinder.w = finder.e + (50, -30);
    %fitfinder.w = finder.e + (50, 30);
    depthfinder.n = finder.s + (-40, -40);
    fitfinder.n = finder.s + (40, -40);
    
    leftToRight(60)(fitfinder, interp);
    
    % Draw
    drawObjects(chunk, frontier, tracker, groove,
                finder, depthfinder, fitfinder, interp);
    
    % Links
    clink(compositionUni)(frontier, chunk);
    clink(dependency)(tracker, groove);
    clink(dependency)(chunk, tracker);
    clink(dependency)(fitfinder, interp);
    item(iStereo)("<<create>>")(obj.e = .5[tracker.n, groove.s]);
    clink(compositionUni)(groove, frontier);
    clink(compositionUni)(finder, tracker);
    clink(inheritance)(depthfinder, finder);
    clink(inheritance)(fitfinder, finder);

endfig;

end
