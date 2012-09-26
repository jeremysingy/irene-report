#------------------------------------------------
# RC file (Makefile) for the master thesis report
#------------------------------------------------

# Select the PDF output and the generator
$pdf_mode = 1;
#$pdflatex = "xelatex %O %S";
#$pdflatex = "xelatex -synctex=1 -interaction=nonstopmode %O %S";

# Specify the directory for all auxiliary files
$aux_dir = 'build';

# Specify the output directory
#$out_dir = 'output';

# Turn recorder option off (no .fls file generated)
#$recorder = 0;

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

# To clean more files extensions with -c and -C options
#$clean_ext = "paux lox pdfsync out";

# Continue processing even with minor errors (e.g. unrecognized cross references)
#$force_mode = 1;