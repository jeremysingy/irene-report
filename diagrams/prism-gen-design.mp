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
Class.wform("Form")()();
Package.winforms("System.Windows.Forms")
    (wform);

%Class.prism("Prism")()();
Class.frame("frmMain")()();
Class.hardware("Hardware")()();
Class.wav("Wav")()();
Class.disc("Disc")()();
Class.cylinder("Cylinder")()();
Class.cylstd("CylStandard")()();
Class.cylmed("CylMedian")()();
Class.disccyl("DiscCyl")()();
Class.discfit("DiscFit")()();
Class.clean("Cleaning")()();
Class.etca("...")()();
Class.etcb("...")()();

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);
    % Position
    topToBottom(40)(wform, frame);
    leftToRight(60)(hardware, frame);
    centered_allign_top(cylinder, disc)(120, below(hardware.s, 60));
    %centered_allign_top(cylstd, cylmed, etc1)(30, below(cylinder.s, 60));
    topToBottom(40)(cylinder, cylmed);
    topToBottom(40)(disc, discfit);
    
    clean.e = hardware.w + (-80, 30);
    wav.e = hardware.w + (-80, -30);
    
    cylstd.right = cylmed.left - 10;
    etca.left = cylmed.right + 10;
    same.top(cylstd, cylmed, etca);
    
    %leftToRight(10)(disccyl, discfit, etcb);
    %centered_allign_top(disccyl, discfit, etc2)(30, below(disc.s, 60));
    disccyl.right = discfit.left - 10;
    etcb.left = discfit.right + 10;
    same.top(disccyl, discfit, etcb);
    
    % Draw
    drawObjects(wform, frame, hardware, wav, disc, cylinder, clean);
    drawObjects(cylstd, cylmed, etca, disccyl, discfit, etcb);
    drawObjects(winforms);
    
    % Links
    clink(inheritance)(frame, wform);
    link(inheritance)(pathStepY(cylinder.n, hardware.s, 20));
    link(inheritance)(pathStepY(disc.n, hardware.s, 20));
    
    link(inheritance)(pathStepY(cylstd.n, cylinder.s, 20));
    link(inheritance)(pathStepY(cylmed.n, cylinder.s, 20));
    link(inheritance)(pathStepY(etca.n, cylinder.s, 20));
    
    link(inheritance)(pathStepY(disccyl.n, disc.s, 20));
    link(inheritance)(pathStepY(discfit.n, disc.s, 20));
    link(inheritance)(pathStepY(etcb.n, disc.s, 20));
    
    clink(compositionUni)(hardware, frame);
    clink(compositionUni)(wav, hardware);
    clink(dependency)(hardware, clean);

endfig;

end
