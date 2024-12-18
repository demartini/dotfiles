function ios-wallpaper --description 'Convert iOS wallpapers to the right size.'
    command mkdir cropped
    for file in *.jpg
        convert "$file" -gravity center -crop 1284x2778+0+0 +repage cropped/"$file"
    end
end
