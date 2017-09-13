# WebHelp Responsive customization plugin to change footer section

This is a sample WebHelp Customization plugin showing how you can transfer meta information specified in the DITA map to the WebHelp Responsive footer.

In this sample, the WebHelp Responsive footer is modified by adding copyright information extracted from the DITA bookmap or by adding the output generation time. The first use-case uses an XSLT-Import extension point while the second uses an XSLT-Parameter extension point.

![Custom footer](https://github.com/radu-pisoi/com.oxygenxml.webhelp.responsive.custom.footer/blob/master/doc/img/WH-XSLT-customization.png)

To use this WebHelp Responsive customization plugin, use one of the following methods:

* **From the Oxygen interface** - Follow these steps:
1. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
2. To install the plugin and transform it, follow the procedure found here: https://www.oxygenxml.com/doc/ug-editor/topics/dita-ot-install-plugin.html

* **From a command line** - Follow these steps:
1. Download **DITA-OT 2.5** 
2. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
3. Install the plugin by running the command ``dita-ot-dir/bin/dita --install=plug-in-zip``. See more details in the [Installing plug-ins](http://www.dita-ot.org/2.5/dev_ref/plugins-installing.html) topic from the DITA-OT documentation.
4. Invoke the WebHelp Responsive transformation as in the following example:
TODO: Review the command
```
    dita.bat -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -f oxy-ug-pdf -output=D:/workspace/userguide-private/DITA/out-pdf --filter=D:/workspace/userguide-private/DITA/author.ditaval -Doxy-ug-distribution=author
```

This project is licensed under the Apache License 2.0. For details, see the [LICENSE](https://github.com/oxygenxml/com.oxygenxml.pdf2.ug/blob/master/LICENSE) file at the top of this repository.
