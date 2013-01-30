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

Class.frontsec("FrontierSection")
    ()
    ("+BestMatching()");
Class.frontier("Frontier")
    ("+Grooves")
    ("+HeightFromX()");
Class.groove("GrooveSection")
    ("+Points", "+BottomFrontier")
    ();
Class.grooveprop("GrooveProperties")
    ("+Signal", "+StdDev", "+Fft")
    ("+ComputeStdDev()", "+ComputeFft()");
%Class.frontlinker("FrontierLinker")
%    ()
%    ("+Link()");

%interp.info.foreColor := (229/255, 229/255, 229/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    %leftToRight(80)(frontsec);
    
    leftToRight(60)(frontsec, frontier, groove);
    topToBottom(40)(grooveprop, groove);
    
    % Draw
    drawObjects(frontsec, frontier, groove, grooveprop);
    
    % Links
    clink(aggregationUni)(frontier, frontsec);
    item(iAssoc)("Frontier")(obj.ne = frontier.w + (0, -6));
    item(iAssoc)("LinkedFrontier")(obj.ne = frontier.w + (0, -12));
    item(iAssoc)("2")(obj.se = frontier.w + (0, 6));
    
    clink(compositionUni)(grooveprop, groove);
    item(iAssoc)("StartProp")(obj.nw = grooveprop.s + (6, 0));
    item(iAssoc)("EndProp")(obj.nw = grooveprop.s + (6, -6));
    item(iAssoc)("2")(obj.ne = grooveprop.s + (-6, 0));
    
    clink(compositionUni)(groove, frontier);
    
    %clink(dependency)(tracker, groove);
    %clink(dependency)(chunk, tracker);
    %item(iStereo)("<<create>>")(obj.e = .5[tracker.n, groove.s]);
    %clink(compositionUni)(groove, frontier);
    %clink(compositionUni)(groove, grooveprop);
    %clink(inheritance)(fitfinder, finder);

endfig;

end
