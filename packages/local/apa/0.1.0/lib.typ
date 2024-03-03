#let apa(title: [], author: [], institution: [], course: [], professor: [], body, title-abbr: [], section: []) = {
  set document(author: author, title: title)
  set page(numbering: "1", number-align: center, margin: 1in, paper: "us-letter", header: align(left, text(gray.darken(50%), title-abbr)))
  set text(font: "Charis SIL", lang: "en", weight: 300, size: 12pt)
  set par(justify: true)
   
  set heading(numbering: "1")
   
  set block(below: 2em, above: 2em)
   
  set par(leading: 2em, first-line-indent: 2em)

  align(center + horizon)[

    #block(text(weight: "bold", title))
    #v(3em)
    #author

    #institution

    #course, #section

    #professor

    #datetime.today().display("[month repr:long] [day], [year]")
  
    #v(15em)
  ]


  pagebreak()

  body
}