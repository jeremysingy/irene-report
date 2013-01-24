input metauml;

% Colors
%iClass.foreColor := (223/255, 232/255, 244/255);

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

Class.misc("Misc")
    ()
    ("+FindPeaks()");

Class.utils("Utils")
    ()
    ("+Interpolate()");

Class.chunk("Chunk")
    ("+Contour", "+Tops", "+Bottoms")
    ("-FindFrontiers()");

Class.frontier("Frontier")
    ("+ChunkId", "+IsTop", "+Border", "+InterpolatedBorder")
    ();

utils.info.foreColor := (223/255, 232/255, 244/255);
chunk.info.foreColor := (223/255, 232/255, 244/255);
frontier.info.foreColor := (223/255, 232/255, 244/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    topToBottom(40)(misc, chunk);
    topToBottom(40)(utils, frontier);
    leftToRight(60)(chunk, frontier);
    
    %same.midx(userctrl, utils);
    %same.midy(hardware, utils);
    
    % Draw
    drawObjects(misc, utils, chunk, frontier);
    
    % Links
    %clink(inheritance)(chunkdetector, userctrl);
    %clink(inheritance)(chunk, panel);
    %clink(aggregationUni)(pictbox, chunkdetector);
    %clink(compositionUni)(pictbox, frame);
    %clink(compositionUni)(triangle, chunk);
    
    %clink(aggregationUni)(hardware, chunkdetector);
    clink(compositionUni)(frontier, chunk);
    clink(dependency)(chunk, misc);
    clink(dependency)(frontier, utils);
    %item(iStereo)("<<create>>")(obj.s = .5[chunkdetector.e, chunk.w])
    
    %clink(dependency)(hardware, utils);
    %clink(dependency)(chunkdetector, utils);
    
    %item(iAssoc)("pict")(obj.ne = pictbox.s + (-5, -5));
    %item(iAssoc)("picture")(obj.nw = pictbox.se + (5, -5));

endfig;

end
