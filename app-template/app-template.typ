#import "@preview/acrostiche:0.7.0": *

#let app_template(
  type: "Type of examination paper",
  title: "Title of the work",
  authors: (
    (
      name: "First name Last name",
      address_1: "Address",
      address_2: "Postcode City",
      student_number: "Matriculation number",
      programme: "Study programme (B.Sc. / M.Sc.)",
    ),
    // (
    //   name: "First name Last name",
    //   address_1: "Address",
    //   address_2: "Postcode City",
    //   student_number: "Matriculation number",
    //   programme: "Study programme (B.Sc. / M.Sc.)",
    // ),
  ),
  reviewer_1: "Name of the 1st reviewer",
  reviewer_2: "Name of the 2nd reviewer",
  semester: "...",
  acronyms: (
    "AI": ("Artificial Intelligence",),
    "IT": ("Information Technology",),
  ),
  doc,
) = {
  let margins_titlepage = (left: 2cm, right: 1.5cm, top: 1.25cm, bottom: 1cm)
  let margins = (left: 3.5cm, right: 2cm, top: 2.75cm, bottom: 2cm)

  let current_heading() = {
    let elems = query(selector(heading.where(level: 1)).after(here()))

    if elems.len() != 0 and elems.first().location().page() == here().page() {
      return elems.first().body
    } else {
      elems = query(selector(heading.where(level: 1)).before(here()))

      if elems.len() != 0 {
        return elems.last().body
      }
    }
    return []
  }

  set text(font: "Verdana")
  set heading(numbering: "1.1")
  set outline(indent: n => {
    if n == 0 or n == 1 {
      return 0em
    } else {
      return n * 1em
    }
  })
  set list(marker: (sym.bullet, sym.bullet.stroked, sym.square.filled.tiny), indent: 16pt)

  set page(
    margin: margins,
    header: box(stroke: (bottom: 0.5pt + black), width: 1fr, inset: (bottom: 2pt), {
      text(size: 10pt, context { current_heading() })
      h(1fr)
      context counter(page).display()
      let num = context counter(heading).at(here())
    }),
    header-ascent: 40%,
    footer: none,
  )

  // Title page content
  [
    #set par(leading: 0.65em * 1.5)
    #set align(center)
    #set page(header: [], margin: margins_titlepage)

    #align(right, image("figures/app_header.png"))

    #v(3em)
    #text(size: 16pt, weight: "bold", type)

    #v(3em)
    #text(size: 10pt, "to the topic")

    #v(6em)
    #text(weight: "bold", size: 24pt, title)

    #v(4em)
    #line(length: 90%, stroke: 1.5pt + black)

    #v(2em)
    #set text(size: 10pt)

    presented to the Faculty of Computer Science \
    of the University of Duisburg-Essen

    #v(4em - 8pt)
    by

    #grid(
      inset: 8pt,
      column-gutter: 10pt,
      columns: authors.len(),
      ..authors.first().keys().map(k => { authors.map(d => d.at(k)) }).flatten(),
    )

    #v(2.5em)

    #show table.cell: it => { pad(y: 12pt, it) }
    #table(
      columns: (0.4fr, 1fr),
      align: left,
      stroke: none,
      // inset: 9pt,
      "Reviewer:", [#reviewer_1 \ #reviewer_2],
      "Semester of study:", [#semester],
    )

    #v(1.5em)

    Information Systems and Application Management
  ]

  show figure.where(kind: table): set block(breakable: true)
  show figure.caption: set text(size: 9pt, weight: "bold")
  show table: set par(justify: false)
  show table.cell: set text(size: 8pt)
  set figure.caption(position: bottom)

  set table(inset: 12pt, stroke: none, align: top + left, fill: (_, y) => {
    if calc.odd(y) { rgb("f2f2f2") } else { none }
  })

  show outline: it => {
    set text(size: 10pt)
    it
  }

  show heading: it => {
    if (it.level == 1) {
      pagebreak()
    }

    set text(size: 18pt - (it.level * 2pt), weight: "bold")

    block(above: 1em, below: 1em, {
      if (it.numbering != none) {
        counter(heading).display(it.numbering)
        h(1.4em)
      }
      it.body
    })
  }

  counter(page).update(1)
  set page(numbering: "I")

  set text(font: "Verdana", size: 10pt)
  set par(leading: 0.65em * 1.65, spacing: 1.2em * 1.5, justify: true)

  {
    show outline.entry.where(level: 1): it => {
      set text(weight: "bold")
      block(above: 1.6em, it)
    }
    outline(title: "Table of Contents", indent: 2em)
  }

  heading(numbering: none, "List of Abbreviations")

  init-acronyms(acronyms)
  print-index(title: "", row-gutter: 1.2em)

  heading(numbering: none, "List of Figures")

  outline(
    title: none,
    target: figure.where(kind: image),
  )

  heading(numbering: none, "List of Tables")

  outline(
    title: none,
    target: figure.where(kind: table),
  )

  counter(page).update(0)
  set page(numbering: "1")

  doc
}
