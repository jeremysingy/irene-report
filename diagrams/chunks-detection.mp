input metauml;

% Colors
%iClass.foreColor := (223/255, 232/255, 244/255);
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

%------------------------------------------------
% Define classes
%------------------------------------------------

Class.hardware("Hardware")
    ("+RawImage")
    ();

Class.chunkdetector("ChunkDetector")
    ()
    ("+Process()");

Class.chunk("Chunk")
    ("+Contour")
    ();

chunkdetector.info.foreColor := (223/255, 232/255, 244/255);
chunk.info.foreColor := (223/255, 232/255, 244/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);

    % Positions
    %leftToRight(50)(form, pictbox, userctrl, panel);
    leftToRight(60)(hardware, chunkdetector, chunk);
    
    %topToBottom(50)(pictbox, frame);
    %topToBottom(50)(userctrl, chunkdetector);
    %topToBottom(50)(panel, chunk);
    
    %topToBottom(130)(pictbox, hardware);
    
    %same.midx(userctrl, utils);
    %same.midy(hardware, utils);
    %same.midx(chunk, triangle);
    %same.midy(utils, triangle);
    
    % Draw
    drawObjects(hardware, chunkdetector, chunk);
    
    % Links
    %link(inheritance)(pathManhattanX(frame.w, form.s));
    %clink(inheritance)(chunkdetector, userctrl);
    %clink(inheritance)(chunk, panel);
    %clink(aggregationUni)(pictbox, chunkdetector);
    %clink(compositionUni)(pictbox, frame);
    %clink(compositionUni)(triangle, chunk);
    
    %clink(aggregationUni)(hardware, frame);
    clink(aggregationUni)(hardware, chunkdetector);
    clink(dependency)(chunkdetector, chunk);
    item(iStereo)("<<create>>")(obj.s = .5[chunkdetector.e, chunk.w])
    
    %clink(dependency)(hardware, utils);
    %clink(dependency)(chunkdetector, utils);
    
    %item(iAssoc)("pict")(obj.ne = pictbox.s + (-5, -5));
    %item(iAssoc)("picture")(obj.nw = pictbox.se + (5, -5));

endfig;

end
