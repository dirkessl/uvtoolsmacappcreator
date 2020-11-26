#!/bin/bash
# UVTools App creator
# Dirk Essl <dirk@essl.de> 2020

mkdir -p ../UVTools.app/Contents/MacOS/UVTools-macOS
mkdir -p ../UVTools.app/Contents/Resources
cp uvtools.icns ../UVTools.app/Contents/Resources

cat <<EOF >../UVTools.app/Contents/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleExecutable</key>
    <string>UVTools</string>
    <key>LSUIElement</key>
    <string>1</string>
    <key>CFBundleIconFile</key>
    <string>uvtools.icns</string>
</dict>
</plist>
EOF

cat <<EOF2 >../UVTools.app/Contents/MacOS/UVTools
#!/bin/bash
THISPATH="\`dirname \$0\`"
cd \$THISPATH/UVtools-macOS
if [ -f /usr/local/share/dotnet/dotnet ];then
        /usr/local/share/dotnet/dotnet UVtools.dll
elif [ -f  /usr/local/bin/dotnet ];then
        /usr/local/bin/dotnet UVtools.dll
fi


EOF2

#copy
rsync -a ./ ../UVTools.app/Contents//MacOS/UVTools-macOS/

chmod +x ../UVTools.app/Contents/MacOS/*
chmod 755 ../UVTools.app/Contents/MacOS/UVTools


