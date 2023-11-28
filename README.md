# right-click-pdf

Add 2 options to the context menu `Send to` :
- PDF Merge : when selecting multiple PDFs, it will create a new pdf containing all selected PDFs
- PDF Split : when selecting a PDFs, it will create a PDF per page

![New Send to context menu options](screenshot.png)
 
# Install / Uninstall

- application will be stored in `%USERPROFILE%\AppData\Local\PDFRightClick`
- the uninstaller will be added in the windows `add or remove programs` menu 

# Developer

- pdftk is used : https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/ - todo use something smaller
- NSIS 3.09 is used to create the installer