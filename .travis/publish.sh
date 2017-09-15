#!/bin/bash

echo "Publish $TRAVIS_BRANCH !"

java -version

echo "====================================="
echo "download DITA-OT 2.5.3"
echo "====================================="
wget https://github.com/dita-ot/dita-ot/releases/download/2.5.3/dita-ot-2.5.3.zip

echo "====================================="
echo "extract DITA-OT"
echo "====================================="
unzip dita-ot-2.5.3.zip >/dev/null

echo "===================================================="
echo "Download WebHelp plugin"
echo "===================================================="
mkdir webhelp-plugin
chdir webhelp-plugin
wget http://mirror.oxygenxml.com/InstData/Editor/Webhelp/DITA-OT%202.x/oxygen-webhelp.zip
unzip oxygen-webhelp.zip >/dev/null
ls -la .
cp -R com.oxygenxml.* ../dita-ot-2.5.3/plugins

echo "===================================================="
echo "List DITA-OT plugins"
echo "===================================================="


chdir ..
ls -la dita-ot-2.5.3/plugins/

echo "====================================="
echo "integrate plugins"
echo "====================================="
sh dita-ot-2.4/bin/dita --install

echo "======================================="
echo "Checkout oXygen User Manual"
echo "======================================="
git clone https://github.com/oxygenxml/userguide.git oXygen-ug
ls -la oXygen-ug/DITA/

echo "====================================="
echo "Transform the oXygen user manual to PDF, editor distribution"
echo "====================================="

export ANT_OPTS=-Xmx1524m
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/editor.ditaval -output=publishing/oXygen-ug/editor -Doxy-ug-distribution=editor

echo "====================================="
echo "Transform the oXygen user manual to PDF, author distribution"
echo "====================================="
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/author.ditaval -output=publishing/oXygen-ug/author -Doxy-ug-distribution=author

echo "====================================="
echo "Transform the oXygen user manual to PDF, developer distribution"
echo "====================================="
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/developer.ditaval -output=publishing/oXygen-ug/developer -Doxy-ug-distribution=developer

cp gh-pages/index.html publishing/index.html
echo "====================================="
echo "List output file"
echo "====================================="
ls -la publishing
ls -la publishing/oXygen-ug/editor
