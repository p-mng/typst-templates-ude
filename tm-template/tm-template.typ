#import "@preview/acrostiche:0.7.0": *

#let tm_template(
  type: "Bachelor project thesis| Master project thesis| Bachelor term paper| Master term paper| Bachelor thesis - exposé | Bachelor thesis| Master thesis -exposé | Master thesis (please delete inappropriate terms)",
  title: "<Titel of Thesis>",
  first_name: "<First name>",
  last_name: "<Last name>",
  address: "<Address line>",
  postal_code: "<postal code>",
  city: "<city>",
  student_number: "<Matrikelnr>",
  course: "<Course of Study>",
  reviewer_1: "<First reviewer>",
  reviewer_2: "<Second reviewer>",
  current_semester: "<Current semester>",
  completed_semesters: "<Completed semesters>",
  acronyms: (
    "ERP": ("Enterprise Resource Planning",),
    "IT": ("Information Technology",),
  ),
  doc,
) = {
  init-acronyms(acronyms)

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
    #set page(header: [])

    #v(7.5em)
    #text(size: 14pt, type)

    #v(7em)
    #text(weight: "bold", size: 16pt, title)

    #v(9em)
    #set text(size: 12pt)

    Presented to the Faculty of Informatics \
    of University Duisburg-Essen

    #v(2.5em)

    #first_name #last_name \
    #address \
    #postal_code #city \
    Matrikelnr: #student_number \
    Course of Study: #course

    #v(2.5em)

    #table(
      columns: (0.6fr, 1fr),
      align: left,
      stroke: none,
      inset: 9pt,
      "Reviewer:", [#reviewer_1 \ #reviewer_2],
      "Semester of study:", [#current_semester \ #completed_semesters],
    )
  ]

  show figure.caption: set text(size: 9pt, weight: "bold")
  set table(inset: 12pt, stroke: 0.5pt + black)
  show table.cell.where(y: 0): set table.cell(inset: 0pt)

  show table: it => {
    pad(left: 0.8cm, right: 0.8cm, it)
  }

  show outline: it => {
    set text(size: 10pt)
    it
  }

  show outline.entry.where(level: 1): it => {
    set text(weight: "bold")
    block(above: 1.6em, it)
  }

  show heading: it => {
    if (it.level == 1) {
      pagebreak()
    }

    set text(size: 18pt - (it.level * 2pt), weight: "bold")

    block(above: 1.5em, below: 1.5em, {
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

  outline(title: "Table of Contents", indent: 2em)

  heading(numbering: none, "List of Abbreviations")

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
