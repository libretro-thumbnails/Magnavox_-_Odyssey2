find . -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -exec sh -c 'identify -format "%w %i\n" "$0" | {
  read width file
  if [ "$width" -lt 320 ]; then
    convert "$file" -resize 320x243! -filter point "$file"
    echo "Zmenšený súbor: $file"
  else
    echo "Preskočený súbor: $file"
  fi
}' {} \;
