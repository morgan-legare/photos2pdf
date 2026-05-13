#!/bin/bash 

read -p "PDF name (without .pdf): " name 
echo -e "Output's name: ${name}.pdf\n"

shopt -s nocaseglob
read -p "File extension (eg. jpg, png, heic): " type
echo -e "Input's extension: ${type}"

echo -e "\nConverting from ${type} to pdf..."
magick $(ls -v *.${type}) input.pdf && gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

wait
cp output.pdf ${name}.pdf
echo -e "${name}.pdf has been created succesfully!\n" 

read -p "Open ${name}.pdf in Firefox? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    firefox ${name}.pdf &
fi

