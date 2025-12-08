#import "@preview/acrostiche:0.7.0": *

#let ai_template(
  title: "Thesis title",
  type: "Seminar thesis/Bachelor thesis/Master thesis",
  first_name: "First name",
  last_name: "Last name",
  address: "Street no., PLZ city",
  study_program: "Bachelor/Master Wirtschaftsinformatik",
  student_number: "1234567",
  reviewer_1: "Prof. Dr. Mario Nadj",
  reviewer_2: "N.N. (only for Bachelor/Master thesis)",
  date: "TT.MM.JJJJ",
  semester: "Summer/Winter semester 2025, 4th Semester",
  acronyms: (
    "BPM": ("Business Process Management",),
    "RPA": ("Robotic Process Automation",),
  ),
  doc,
) = {
  let margins = (left: 3cm, right: 2cm, top: 2.75cm, bottom: 2cm)

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
      set text(size: 8pt)
      title
      h(1fr)
      context counter(page).display()
      let num = context counter(heading).at(here())
    }),
    footer: none,
  )

  // Header image
  place(top + left, dx: -margins.left + 0.4cm, dy: -margins.top + 0.5cm, image(
    "figures/ude_header.png",
    width: 100% + margins.left + margins.right - 2 * 0.4cm,
  ))

  // Title page content
  [
    #set par(leading: 0.65em * 0.8)
    #set align(center)

    // Header text
    #v(8.5em)
    #set text(size: 28pt)
    #text(weight: "bold", title) \
    #text(size: 12pt, type)

    // Paper information
    #v(1em)
    #set text(size: 10pt)
    #table(
      columns: (1fr, 1fr),
      align: left,
      stroke: none,
      inset: 9pt,
      "Submitted by:", [#first_name #last_name],
      "Address:", address,
      "Study program:", study_program,
      "Matriculation number:", student_number,
      "First reviewer:", reviewer_1,
      "Second reviewer:", reviewer_2,
      "Delivery date:", date,
      "Semester of study:", semester,
    )

    #v(4.5em)
    University of Duisburg-Essen \ \
    Chair of Information Systems and Artificial Intelligence in Marketing \ \
    Faculty of Computer Science
  ]

  // Footer image
  place(bottom + left, dx: -margins.left + 0.4cm, dy: margins.bottom - 1cm, image(
    "figures/ude_footer.png",
    width: 100% + margins.left + margins.right - 2 * 0.4cm,
  ))

  show figure.caption: set text(size: 8pt, weight: "bold")
  show figure.where(kind: table): set figure.caption(position: top)
  set table(inset: 12pt, stroke: 0.5pt + black)
  show table.cell.where(y: 0): set table.cell(inset: 0pt)

  show table: it => {
    pad(left: 0.8cm, right: 0.8cm, it)
  }

  show outline.entry.where(level: 1): it => {
    block(above: 2em, it)
  }

  show heading: it => {
    if (it.level == 1) {
      pagebreak()
    }

    set text(size: 18pt - (it.level * 2pt), weight: "bold")

    block(above: 1.5em, below: 1.5em, {
      if (it.numbering != none) {
        counter(heading).display(it.numbering)
        h(0.8em)
      }
      it.body
    })
  }

  counter(page).update(1)
  set page(numbering: "i")

  set text(font: "Verdana", size: 10pt)
  set par(leading: 0.65em * 1.65, spacing: 1.2em * 1.5, justify: true)

  {
    set text(size: 9pt)
    show outline.entry.where(level: 1): it => {
      set text(weight: "bold")
      block(above: 1.6em, it)
    }
    outline(title: "Table of Contents")
  }

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

  heading(numbering: none, "List of Abbreviations")

  init-acronyms(acronyms)
  print-index(title: "", row-gutter: 1.2em, delimiter: "")

  counter(page).update(0)
  set page(numbering: "1")

  doc
}
