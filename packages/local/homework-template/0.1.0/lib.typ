// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Charis SIL", lang: "en", weight: 300)
  set par(justify: false)
   
  set heading(numbering: "1.1")
   
  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)
   
  set block(below: 1.5em, above: 1.5em)
   
  set par(leading: 1em)
  
  // Title row.
  align(center)[
    #block(text(font: "quicksand", weight: 700, 1.75em, title))
  ]
   
  // Author information.
  pad(
    top: 0.8em,
    bottom: 0.8em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => text(font: "Innovate")[#align(center, strong(author))]),
    ),
  )
   
  // Main body.
  set par(justify: true)
   
  body
}


#let cong = $tilde.equiv$
#let id = $#math.bb("1")$

#let nsg = symbol("⊴")
#let subgroup = nsg;

#let iprod(x, y)=$lr(angle.l #x, #y angle.r)$


#let id = math.bb("1");

#let pp = math.cal("p");

#let sim = sym.tilde.op

#let cplus = sym.plus.circle

#import "@preview/ctheorems:1.0.0": *

#import "@preview/showybox:2.0.1": showybox

#let thmbox(
  identifier,
  head,
  supplement: auto,
  fill: none,
  stroke: none,
  inset: 1.2em,
  radius: 0.3em,
  breakable: false,
  padding: (top: 0.2em, bottom: 0.75em, left: 0.5em, right: 0.5em),
  namefmt: x => [#x],
  titlefmt: strong,
  bodyfmt: x => x,
  separator: [:#h(0.2em)],
  base: "heading",
  base_level: none,
) = {
  if supplement == auto {
    supplement = head
  }
  let boxfmt(name, number, body, title: auto) = {
    if title == auto {
      title = head
    }
    
    if not number == [] {
      title += " " + number
    }
     
    if not name == none {
      name = [ #namefmt(name) ]
    } else {
      name = title
      title = none
    }
    
    title = titlefmt(title)
    body = bodyfmt(body)
    
    showybox(title-style: (boxed-style: (
      anchor: (x: left, y: horizon),
      radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
      offset: (x: 0.5em),
    )), frame: (
      title-color: fill.darken(50%),
      body-color: fill.lighten(60%),
      footer-color: fill.lighten(80%),
      border-color: fill.darken(70%),
      radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
    ), title: text(font: "Quicksand", weight: "regular")[#name])[
      #pad(..padding)[
        #text(font: "Quicksand", weight: "bold", title) #h(0.5em) #body
      ]
    ]
  }
  
  return thmenv(identifier, supplement, base, base_level, boxfmt)
}

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

#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",
  fill: teal,
  titlefmt: strong,
)

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

#let solution = thmbox("solution", "Solution", fill: green.lighten(50%))
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

#let remark = thmbox("remark", "Remark", base: "theorem", fill: orange, stroke: orange).with(numbering: none)

#let todo = thmbox("todo", "TODO", base: "theorem", fill: yellow.lighten(50%)).with(numbering: none)

#let tryref(label) = {
  locate(loc=>{
    if query(label, loc).len() == 0 {
      return str(label)
    } else {
      return ref(label)
    }
  })
}