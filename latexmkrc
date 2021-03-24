@default_files = ('my_thesis.tex');
set_tex_cmds( '-synctex=1 --shell-escape %O %S' );

$pdf_mode = 4;
$postscript_mode = $dvi_mode = 0;

# Uncomment for glossaries
# add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
# add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
# $clean_ext .= " acr acn alg glo gls glg";
# sub makeglossaries {
#     my ($base_name, $path) = fileparse( $_[0] );
#     pushd $path;
#     my $return = system "makeglossaries", $base_name;
#     popd;
#     return $return;
# }

# Uncomment for nomenclature
# add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
# sub makenlo2nls {
# system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
# }
 