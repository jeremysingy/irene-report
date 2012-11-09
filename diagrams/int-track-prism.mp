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

%------------------------------------------------
% Define PRISM classes
%------------------------------------------------

Class.pictbox("PictureBox")()();
Class.userctrl("UserControl")()();
Class.form("Form")()();

Class.frame("frmMain")
    ()
    ();

Class.intctrl("InteractiveControl")
    ()
    ("+SetPosition()");

Class.drawpanel("DrawPanel")
    ()
    ();

Class.hardware("Hardware")
    ("+RawImage", "+ManualTrack")
    ();

Class.utils("Utils")
    ()
    ("+BitmapFromData()", "+ToGraphicsCoord()", "+NormValue()", "+LinearInt()");

Package.winforms("System.Windows.Forms")
    (pictbox, userctrl, form);

iAssoc.iFont.name := "cs-lmss10";

%------------------------------------------------
% PRISM overview TODO
%------------------------------------------------
%outputtemplate := "prism-overview.mps";
%beginfig(2);
%
%endfig;

%------------------------------------------------
% Interactive tracking
%------------------------------------------------
outputtemplate := "int-track-prism.mps";
beginfig(1);

    % Positions
    leftToRight(50)(pictbox, userctrl, form);
    
    topToBottom(50)(pictbox, frame);
    topToBottom(50)(userctrl, intctrl);
    topToBottom(50)(form, drawpanel);
    
    topToBottom(130)(pictbox, hardware);
    
    same.midx(form, utils);
    same.midy(hardware, utils);
    
    % Draw
    drawObjects(pictbox, userctrl, form,
                frame, intctrl, drawpanel,
                hardware, utils);
    
    drawObjects(winforms);  
    
    % Links
    clink(inheritance)(intctrl, userctrl);
    clink(inheritance)(drawpanel, form);
    clink(aggregationUni)(pictbox, intctrl);
    clink(compositionUni)(pictbox, frame);
    
    clink(aggregationUni)(hardware, frame);
    clink(aggregationUni)(hardware, intctrl);
    
    clink(dependency)(hardware, utils);
    clink(dependency)(intctrl, utils);
    
    item(iAssoc)("pict")(obj.ne = pictbox.s + (-5, -5));
    item(iAssoc)("picture")(obj.nw = pictbox.se + (5, -5));

endfig;

end
