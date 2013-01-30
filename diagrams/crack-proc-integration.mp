input metauml;

% Colors
iClass.foreColor := (223/255, 232/255, 244/255);
iPackage.foreColor := (251/255, 249/255, 194/255);

% Fonts
% other: bcrr8r, lmbo10, bcrb8r, t1xbsssc, tyxtt, cmtt12, cs-lmr10, cl-lmss10
iClass.iName.iFont.name := "cs-lmssbx10";
iClass.iAttributeStack.iPict.iFont.name := "cs-lmss10";
iClass.iAttributeStack.iPict.iFont.scale := 0.8;
iClass.iMethodStack.iPict.iFont.name := "cs-lmss10";
iClass.iMethodStack.iPict.iFont.scale := 0.8;
iPackage.iNameStack.iPict.iFont.name := "cs-lmssbx10";
iAssoc.iFont.name := "cs-lmss10";

% Only class names
iClass.iName.top    := 10;
iClass.iName.bottom := 10;
iClass.iAttributeStack.top := 0;
iClass.iAttributeStack.bottom := 0;
iClass.iMethodStack.top := 0;
iClass.iMethodStack.bottom := 0;
iClass.bottom := 20;

%------------------------------------------------
% Define classes
%------------------------------------------------

Class.frame("frmMain")()();
Class.hardware("Hardware")()();

Class.cracksproc("CracksProcessor")
    ()
    ("+Process()", "+FindChunks()", "+TrackChunk()", "+LinkFrontiers()", "+MatchTraces()", "+BuildTracks()", "+DrawObjects()");
Class.cracksconf("CracksConfig")
    ("+GrooveDelta", "+ChunkMinSize", "+CompareTime", "+...")
    ();
Class.drawer("ObjectDrawer")
    ("+DrawChunk()", "+DrawLink()", "...")
    ();

Class.chunk("CrackedChunk")()();
Class.chunkdet("ChunkDetector")()();
Class.frontier("Frontier")()();
%Class.frontsec("FrontierSection")()();
Class.frontlinker("FrontierLinker")()();
Class.tracker("GrooveTracker")()();
%Class.finder("AbstractBottomFinder")()();
%Class.depthfinder("DepthFinder")()();
%Class.fitfinder("FitFinder")()();
%Class.groove("GrooveSection")()();
%Class.grooveprop("GrooveProperties")()();
Class.groovelinker("GrooveLinker")()();
Class.track("LinkedTrack")()();

Package.cracksprocess("CracksProcessing")
    (cracksconf, cracksproc, drawer, chunk, chunkdet, frontier, frontlinker, tracker, groovelinker, track);
Package.tracking("Tracking")
    (finder, depthfinder, fitfinder);

frame.info.foreColor := (229/255, 229/255, 229/255);
hardware.info.foreColor := (229/255, 229/255, 229/255);

% Redefine default values for certain classes
cracksproc.info.iName.top := 2; cracksproc.info.iName.bottom := 2;
cracksproc.info.iAttributeStack.top := 2; cracksproc.info.iAttributeStack.bottom := 2;
cracksproc.info.iMethodStack.top := 2; cracksproc.info.iMethodStack.bottom := 2;
cracksconf.info.iName.top := 2; cracksconf.info.iName.bottom := 2;
cracksconf.info.iAttributeStack.top := 2; cracksconf.info.iAttributeStack.bottom := 2;
cracksconf.info.iMethodStack.top := 2; cracksconf.info.iMethodStack.bottom := 2;
drawer.info.iName.top := 2; drawer.info.iName.bottom := 2;
drawer.info.iAttributeStack.top := 2; drawer.info.iAttributeStack.bottom := 2;
drawer.info.iMethodStack.top := 2; drawer.info.iMethodStack.bottom := 2;

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    leftToRight(80)(hardware, cracksproc);
    %leftToRight(80)(frame, cracksconf);
    same.midx(frame, hardware);
    same.midy(frame, cracksconf);
    
    leftToRight(80)(cracksproc, chunkdet);
    topToBottom(40)(cracksconf, cracksproc, drawer);
    
    topToBottom(10)(chunk, frontier, track);
    topToBottom(40)(track, chunkdet);
    topToBottom(10)(chunkdet, tracker, frontlinker, groovelinker);
    %leftToRight(40)(frontier, groove);
    
    %leftToRight(40)(tracker, finder);
    %depthfinder.n = finder.s + (-40, -40);
    %fitfinder.n = finder.s + (40, -40);
    
    % Draw
    drawObjects(frame, hardware,
                cracksproc, cracksconf, drawer,
                chunk, frontier, track,
                chunkdet, tracker, frontlinker, groovelinker);
    
    drawObjects(cracksprocess); %, tracking);
    
    % Links
    clink(compositionUni)(hardware, frame);
    clink(compositionUni)(cracksproc, hardware);
    clink(compositionUni)(cracksconf, frame);
    
    clink(aggregationUni)(cracksconf, cracksproc);
    clink(compositionUni)(drawer, cracksproc);
    
    clink(compositionUni)(chunk, cracksproc);
    clink(compositionUni)(frontier, cracksproc);
    clink(compositionUni)(track, cracksproc);
    clink(compositionUni)(chunkdet, cracksproc);
    clink(compositionUni)(tracker, cracksproc);
    clink(compositionUni)(frontlinker, cracksproc);
    clink(compositionUni)(groovelinker, cracksproc);
    
    %clink(compositionUni)(frontier, chunk);
    %clink(compositionUni)(groove, frontier);
    %clink(compositionUni)(finder, tracker);
    %clink(inheritance)(depthfinder, finder);
    %clink(inheritance)(fitfinder, finder);

endfig;

end
