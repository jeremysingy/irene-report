#------------------------------------------------
# RC file (latexmk makefile) for the master thesis report
#------------------------------------------------

# Select the PDF output and the generator
$pdf_mode = 1;

# Add the shell-escape option for tikzexternalize 
$pdflatex = "pdflatex -shell-escape %O %S";

# Test to use xelatex
#$pdflatex = "xelatex %O %S";
#$pdflatex = "xelatex -synctex=1 -interaction=nonstopmode %O %S";

# Specify the directory for all auxiliary files
$aux_dir = 'build';

# Specify the output directory
$out_dir = 'build';

# To clean more files extensions with -c and -C options
$clean_ext = "bbl glg glo gls ist lol fls pdf";

# Turn recorder option off (no .fls file generated)
#$recorder = 0;

# Print the simple error log in silent mode
$latex_silent_switch = "-interaction=batchmode -c-style-errors";

# Enables makeglossaries to work with subdirectory outputs
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $return = system "makeglossaries $base_name";
    popd;
    return $return;
}

#######################################################

# TODO other options to test

#$bibtex_use = 2;
#$print_type = 'pdf'; # normally not mandatory

# Change the PDF viewer (e.g. not to use acroread)
#$pdf_previewer = "";

# 0 to perform automatic update, 1 to manual update (often juste click)
#$pdf_update_method = 0;

# Continue processing even with minor errors (e.g. unrecognized cross references)
#$force_mode = 1;