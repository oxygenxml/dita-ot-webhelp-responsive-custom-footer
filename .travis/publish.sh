#!/bin/bash

echo "Publish $TRAVIS_BRANCH !"

java -version

echo "Root folder"
ls -la .

echo "====================================="
echo "download DITA-OT 2.5.3"
echo "====================================="
wget https://github.com/dita-ot/dita-ot/releases/download/2.5.3/dita-ot-2.5.3.zip  >/dev/null

echo "====================================="
echo "extract DITA-OT"
echo "====================================="
unzip dita-ot-2.5.3.zip >/dev/null

echo "===================================================="
echo "Download WebHelp plugin"
echo "===================================================="
mkdir webhelp-plugin
chdir webhelp-plugin
wget http://mirror.oxygenxml.com/InstData/Editor/Webhelp/DITA-OT-2.x/oxygen-webhelp.zip
unzip oxygen-webhelp.zip >/dev/null

cp ../resources/doc/licensekey.txt com.oxygenxml.webhelp.responsive
ls -la com.oxygenxml.webhelp.responsive
cp -R com.oxygenxml.* ../dita-ot-2.5.3/plugins

chdir ..
echo "===================================================="
echo "Copy extension plugin"
echo "===================================================="
mkdir dita-ot-2.5.3/plugins/com.oxygenxml.webhelp.responsive.custom.footer
cp *.xsl dita-ot-2.5.3/plugins/com.oxygenxml.webhelp.responsive.custom.footer
cp params.xml dita-ot-2.5.3/plugins/com.oxygenxml.webhelp.responsive.custom.footer/params.xml
cp plugin.xml dita-ot-2.5.3/plugins/com.oxygenxml.webhelp.responsive.custom.footer/plugin.xml

echo "===================================================="
echo "List DITA-OT plugins"
echo "===================================================="
ls -la dita-ot-2.5.3/plugins/
ls -la dita-ot-2.5.3/plugins/com.oxygenxml.webhelp.responsive.custom.footer

echo "====================================="
echo "integrate plugins"
echo "====================================="
sh dita-ot-2.5.3/bin/dita --install

echo "====================================="
echo "Transform the sample to WebHelp Responsive output"
echo "====================================="

export ANT_OPTS=-Xmx1524m
sh dita-ot-2.5.3/bin/dita -i resources/sample/it-book/taskbook.ditamap -f webhelp-responsive -output=publishing/it-book -v -Dwebhelp.footer.add.generation.time=yes

echo "====================================="
echo "Copy Jekyll files"
echo "====================================="
cp -R resources/gh-pages/jekyll/* publishing

echo "====================================="
echo "List output file"
echo "====================================="
ls -la publishing
ls -la publishing/it-book
