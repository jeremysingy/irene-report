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

Class.hardware("Hardware")
    ("+BinImage")
    ();

Class.misc("Misc")
    ()
    ("+FindPeaks()", "+FilterGrooveBottoms()");

Class.utils("Utils")
    ()
    ("+Interpolate()", "+NormalizedValuesBin()");

Class.chunk("Chunk")
    ("+Tops")
    ("+FindGrooves()");

Class.frontier("Frontier")
    ("+InterpolatedBorder")
    ("+FindGrooves()");

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
    leftToRight(60)(hardware, misc);
    leftToRight(60)(chunk, frontier);
    
    %same.midx(userctrl, utils);
    %same.midy(hardware, utils);
    
    % Draw
    drawObjects(hardware, misc, utils, chunk, frontier);
    
    % Links
    clink(compositionUni)(frontier, chunk);
    %clink(dependency)(chunk, misc);
    clink(dependency)(misc, hardware);
    item.aName(iAssoc)("BinImage")(aName.s = .5[hardware.e, misc.w]);
    clink(dependency)(frontier, utils);
    clink(dependency)(frontier, misc);

endfig;

end
