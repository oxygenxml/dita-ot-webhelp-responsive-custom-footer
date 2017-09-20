# WebHelp Responsive customization plugin to change footer section

Sample WebHelp Responsive Customization plugin that shows how you can transfer meta information specified in the DITA map to the WebHelp Responsive footer.

In this sample, the footer of the WebHelp Responsive output is modified by adding copyright information extracted from the DITA bookmap or by adding the output generation time.

![Custom footer](https://github.com/radu-pisoi/com.oxygenxml.webhelp.responsive.custom.footer/blob/master/resources/gh-pages/jekyll/img/WH-XSLT-customization.png)

This project uses Travis CI for continuous integration, so a WebHelp Responsive instance is generated whenever the customization is modified. You can view the results of this customization by opening the following link: [WebHelp Responsive custom footer ](https://oxygenxml.github.io/com.oxygenxml.webhelp.responsive.custom.footer/it-book/index.html). You can read more details about this customization in the [GitHub WIKI pages](https://github.com/oxygenxml/com.oxygenxml.webhelp.responsive.custom.footer/wiki/WebHelp-Responsive-customization-plugin-to-change-footer-section).

To use this WebHelp Responsive customization plugin, use one of the following methods:

* **From the Oxygen interface** - Follow these steps:
1. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
2. To install the plugin and transform it, follow the procedure found here: https://www.oxygenxml.com/doc/ug-editor/topics/dita-ot-install-plugin.html

* **From a command line** - Follow these steps:
1. Download **DITA-OT 2.5**.
2. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
3. Install the plugin by running the command ``dita-ot-dir/bin/dita --install=plug-in-zip``. See more details in the [Installing plug-ins](http://www.dita-ot.org/2.5/dev_ref/plugins-installing.html) topic from the DITA-OT documentation.
4. Invoke the WebHelp Responsive transformation as in the following example:

```
sh dita-ot-2.5.3/bin/dita -i resources/sample/it-book/taskbook.ditamap -f webhelp-responsive -output=publishing/it-book -v -Dwebhelp.footer.add.generation.time=yes
```

This customization sample is compatible with [WebHelp Responsive](https://www.oxygenxml.com/xml_webhelp.html) 19.1. It was tested with [DITA-OT](http://www.dita-ot.org/) 2.5.3.

This project is licensed under the Apache License 2.0. For details, see the [LICENSE](https://github.com/radu-pisoi/com.oxygenxml.webhelp.responsive.custom.footer/blob/master/LICENSE) file at the top of this repository.
