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
cp ../doc/licensekey.txt com.oxygenxml.webhelp
ls -la com.oxygenxml.webhelp
cp -R com.oxygenxml.* ../dita-ot-2.5.3/plugins

echo "===================================================="
echo "List DITA-OT plugins"
echo "===================================================="
chdir ..
ls -la dita-ot-2.5.3/plugins/

echo "====================================="
echo "integrate plugins"
echo "====================================="
sh dita-ot-2.5.3/bin/dita --install

echo "====================================="
echo "Transform the sample to WebHelp Responsive output"
echo "====================================="

export ANT_OPTS=-Xmx1524m
sh dita-ot-2.5.3/bin/dita -i resources/sample/it-book/taskbook.ditamap -f webhelp-responsive -output=publishing/it-book

cp resources/gh-pages/index.html publishing/index.html
echo "====================================="
echo "List output file"
echo "====================================="
ls -la publishing
ls -la publishing/it-book
