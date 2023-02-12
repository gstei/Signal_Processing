# latex2html_via_tex4ht

Being a novice, my problem was to make an HTML file with plenty of mathematics from a LaTeX one. As a beginner, I immediately faced the following problems:

* How to run Tex4ht to get HTML file with mathematics?
* What to do to make proper referencing of mathematical formulas?
* How to cope with TikZ figures?

After a while I discovered that the most suitable way for me is to join
**Tex4ht** with **MatJax**. Example to transform TeX files with plenty of mathematics to HTML is contained here.

## Generating HTML

1. Create a temporary directory and put there all the files from directory **latex2html_via_tex4ht**
2. Run the command

    ```shell
    my_make4ht+include_css+more_selective_cleaning.cmd main2_for_html.tex 
    ```

3. After a while you should get **latex2html_via_tex4ht.html**
4. In **latex2html_via_tex4ht.html** prepend "*by hand*" paths to figure files by "./"

### Remark

Described procedure does not create **latex2html_via_tex4ht.pdf** file. If you want to create **latex2html_via_tex4ht.pdf**, run usual **PDFLaTeX** procedure.
