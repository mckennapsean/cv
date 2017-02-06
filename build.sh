#/bin/sh

# filenames
source="cv"
template=$source"-template"

# clean all files when given "-c" flag, otherwise build pdf
if [ "$1" == "-c" ]; then
  rm $source.pdf
else

# build PDF using pandoc, xelatex
pandoc $source.yaml -o $source.pdf --template=$template.tex --latex-engine=xelatex

fi
