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

Class.form("Form1")()();
Class.imgproc("ImageProcess")()();
Class.track("Track")()();
%Class.fit("Fit")()();
Class.wav("Wav")()();
Class.db("DB")()();
Class.fft("FFTTools")()();

%------------------------------------------------
% Draw diagram
%------------------------------------------------
beginfig(1);
    % Position
    topToBottom(40)(wform, form);
    leftToRight(60)(fft, form, wav);
    topToBottom(40)(form, track);
    leftToRight(40)(imgproc, track, db);
    
    %centered_allign_top(track, wav)(20, below(form.s, 60));
    %imgproc.e = track.w - (20, 0);
    %db.w = wav.e + (20, 0);
    
    % Draw
    drawObjects(wform, fft, form, wav);
    drawObjects(imgproc, track, db);
    drawObjects(winforms);  
    
    % Links
    clink(inheritance)(form, wform);
    
    clink(compositionUni)(imgproc, form);
    clink(compositionUni)(track, form);
    clink(compositionUni)(db, form);
    
    clink(dependency)(form, fft);
    clink(dependency)(form, wav);

endfig;

end
