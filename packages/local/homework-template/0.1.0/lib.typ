// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en", weight: 300)
  set par(justify: false)
  
  set heading(numbering: "1.1")
  
  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)
  
  set block(below: 1.5em, above: 1.5em)
  
  set par(leading: 1em)
  
  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]
  
  // Author information.
  pad(top: 0.8em, bottom: 0.8em, x: 2em, grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(center, strong(author))),
  ))
  
  // Main body.
  set par(justify: true)
  
  body
}


#let cong = $tilde.equiv$
#let id = $#math.bb("1")$

#let nsg = symbol("⊴")
#let subgroup = nsg;

#let iprod(inner)=$lr(angle.l #inner angle.r)$


#let id = math.bb("1");

#let pp = math.cal("p");

#let sim = sym.tilde.op

#let cplus = sym.plus.circle

#import "@preview/ctheorems:1.0.0": *

#let thm = thmbox(
  "theorem",
  smallcaps[Theorem],
  base_level: 2,
  fill: fuchsia.lighten(90%),
  stroke: fuchsia.darken(20%),
)

#let proposition = thmbox(
  "theorem",
  "Proposition",
  fill: rgb("#FDFCDC"),
  stroke: rgb("#FDFCDC").darken(20%),
)
#let lemma = thmbox(
  "theorem",
  "Lemma",
  fill: rgb("#eeffee").lighten(50%),
  stroke: rgb("#eeffee").darken(10%),
)

#let corollary = thmplain("corollary", "Corollary", base: "theorem", titlefmt: strong)

#let definition = thmbox(
  "definition",
  "Definition",
  inset: (x: 1.2em, top: 1em, bottom: 1em),
  base_level: 2,
  fill: aqua.lighten(70%),
  stroke: aqua.darken(20%),
)

#let assumption = thmbox(
  "assumption",
  "Assumption",
  fill: rgb("FFA1F5").lighten(50%),
  stroke: rgb("FFA1F5").darken(20%),
)

#let example = thmplain("example", "Example").with(numbering: none)

#let solution = thmbox("solution", "Solution", stroke: green.lighten(50%))
#let exproof = thmenv(
  "proof",
  "Proof",
  none,
  none,
  (name, number, body, color: black) => box(inset: 1em)[
    #let name = if name != none { smallcaps[ (#name) ] } else {}
    
    #smallcaps[*Proof #number* #name:] #body
    #h(1fr) $square$
  ],
)

#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$],
).with(numbering: none)

#let proofidea = thmplain(
  "proof",
  "Proof Idea",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$],
).with(numbering: none)

#let remark = thmbox(
  "remark",
  "Remark",
  base: "theorem",
  fill: orange.lighten(50%),
  stroke: orange.darken(20%),
).with(numbering: none)

#let todo = thmbox("todo", "TODO", base: "theorem", fill: yellow.lighten(50%)).with(numbering: none)