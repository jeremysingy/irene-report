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

Class.form("Form")()();
Class.pictbox("PictureBox")()();
Class.userctrl("UserControl")()();
Class.panel("Panel")()();

Class.frame("frmMain")
    ()
    ();

Class.hardware("Hardware")
    ("+RawImage", "+ManualTrack")
    ();

Class.intctrl("InteractiveControl")
    ()
    ("+SetPosition()");

Class.drawpanel("DrawPanel")
    ()
    ();

Class.triangle("BeaconTriangle")
    ()
    ("+Draw()");

Class.utils("Utils")
    ()
    ("+BitmapFromData()", "+NormValue()", "+LinearInt()");

Package.winforms("System.Windows.Forms")
    (form, pictbox, userctrl, panel);

intctrl.info.foreColor := (223/255, 232/255, 244/255);
drawpanel.info.foreColor := (223/255, 232/255, 244/255);
triangle.info.foreColor := (223/255, 232/255, 244/255);
utils.info.foreColor := (223/255, 232/255, 244/255);

%------------------------------------------------
% Draw diagram
%------------------------------------------------
%outputtemplate := "int-track-prism.mps";
beginfig(1);

    % Positions
    leftToRight(50)(form, pictbox, userctrl, panel);
    
    topToBottom(50)(pictbox, frame);
    topToBottom(50)(userctrl, intctrl);
    topToBottom(50)(panel, drawpanel);
    
    topToBottom(130)(pictbox, hardware);
    
    same.midx(userctrl, utils);
    same.midy(hardware, utils);
    same.midx(drawpanel, triangle);
    same.midy(utils, triangle);
    
    % Draw
    drawObjects(form, pictbox, userctrl, panel,
                frame, intctrl, drawpanel, triangle,
                hardware, utils);
    
    drawObjects(winforms);
    
    % Links
    %clink(inheritance)(frame, form);
    link(inheritance)(pathManhattanX(frame.w, form.s));
    clink(inheritance)(intctrl, userctrl);
    clink(inheritance)(drawpanel, panel);
    clink(aggregationUni)(pictbox, intctrl);
    clink(compositionUni)(pictbox, frame);
    clink(compositionUni)(triangle, drawpanel);
    
    clink(aggregationUni)(hardware, frame);
    clink(aggregationUni)(hardware, intctrl);
    
    clink(dependency)(hardware, utils);
    clink(dependency)(intctrl, utils);
    
    item(iAssoc)("pict")(obj.ne = pictbox.s + (-5, -5));
    item(iAssoc)("picture")(obj.nw = pictbox.se + (5, -5));

endfig;

end
