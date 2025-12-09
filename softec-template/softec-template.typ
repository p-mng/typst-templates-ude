#import "@preview/marge:0.1.0"

#let softec_template(
  lang: "de",
  type: "Abschlussarbeit",
  title_connector: "zum Thema",
  title: [Beispiel-Dokument für die \ LaTeX-Formatvorlage],
  title_alt: "Example document for the LaTeX-template",
  date: "25. Oktober 2023",
  author_name: "Max Mustermann",
  author_street: "Musterstrasse 123",
  author_zip: "12345",
  author_city: "Musterstadt",
  reviewer_1: "Prof. Dr. Stefan Eicker",
  reviewer_2: "Prof. Dr. John Doe",
  supervisor: "Dipl.-Wirt.-Inf Some Body",
  semester: "Wintersemester 2013/2014",
  abstract: "Jede wissenschaftliche Arbeit sollte eine Kurzfassung am Anfang aufweisen. Diese Kurzfassung sollte etwa eine halbe Seite lang sein.",
  abstract_alt: "As all theses have an English title, there should be an English abstract as well. Folglich sollten auch deutsche Arbeiten einen englischen Abstract haben. Falls die Abstracts zu lang werden, gibt es im Handbuch eine Hilfestellung.",
  doc,
) = {
  let ude_blue = rgb("004c93")
  let ude_blue_dark = rgb("003567")
  let ude_green = rgb("004000")

  let margins = (left: 3.1cm, right: 3.1cm, top: 3.5cm, bottom: 5cm)

  set text(font: "Linux Biolinum", lang: lang)
  set page(margin: margins)

  let has_heading() = {
    let elems = query(selector(heading.where(level: 1)).after(here()))

    if elems.len() != 0 and elems.first().location().page() == here().page() {
      return true
    }
    return false
  }

  let current_heading() = {
    let elems = query(selector(heading.where(level: 1)).after(here()))

    if elems.len() != 0 and elems.first().location().page() == here().page() {
      return [#counter(heading.where(level: 1)).display() #elems.first().body]
    } else {
      elems = query(selector(heading.where(level: 1)).before(here()))

      if elems.len() != 0 {
        return [#counter(heading.where(level: 1)).display() #elems.last().body]
      }
    }
    return []
  }

  let header_full = table(
    stroke: (bottom: 0.5pt + ude_blue, top: none, right: none, left: none),
    inset: 0pt,
    columns: (1fr, auto),
    {
      set text(size: 10pt)
      pad(bottom: 4pt, context current_heading())
    },
    {
      set align(right)
      set text(fill: white)
      block(fill: ude_blue, inset: (left: 40pt, right: 10pt, top: 4pt, bottom: 4pt), context counter(page).display())
    },
  )

  let header_minimal = block(
    stroke: none,
    inset: 0pt,
    width: 100%,
    {
      set align(right)
      set text(fill: white)
      block(fill: ude_blue, inset: (left: 40pt, right: 10pt, top: 4pt, bottom: 4pt), context counter(page).display())
    },
  )

  // Title page
  [
    #set align(center)
    #set text(size: 12pt)
    #set page(margin: 0.5cm)

    #image("figures/ude_header.png")

    #v(44pt)

    #text(size: 14pt, type) \
    #text(size: 10pt, title_connector)

    #text(size: 24pt, weight: "bold", title)

    #v(42pt)

    #text(weight: "bold", title_alt)

    #v(42pt)

    Vorgelegt der Fakultät für Wirtschaftswissenschaften der \
    Universität Duisburg-Essen

    #v(140pt)

    #text(size: 14pt, date)

    #v(28pt)

    #[
      #set align(left)
      #set text(size: 11pt)
      #pad(x: margins.left - 0.5cm, table(
        stroke: none,
        columns: (auto, auto),
        "von:", author_name,
        [], author_street,
        [], [#author_zip #author_city],
        [], [],
        "Gutachter:", reviewer_1,
        [], reviewer_2,
        [], [],
        "Betreuer:", supervisor,
      ))
    ]

    #v(32pt)

    #semester
  ]

  set figure(numbering: num => numbering(
    "1.1",
    counter(heading.where(level: 1)).get().first(),
    num,
  ))

  set text(size: 11pt)
  set par(justify: true)
  set outline.entry(fill: pad(left: 0.5em, right: 2em, repeat(gap: 0.5em, ".")))
  set enum(indent: 2em, tight: false, spacing: 16pt)
  set list(indent: 2em, tight: false, spacing: 16pt)
  set heading(numbering: "1.1")
  set page(
    margin: margins,
    header: context { if has_heading() { header_minimal } else { header_full } },
    header-ascent: 35%,
    footer: none,
  )

  show link: set text(fill: ude_green)
  show outline: set text(fill: ude_blue_dark)
  show figure.caption: set text(size: 8pt)
  show figure: set block(below: 28pt)

  show heading: it => {
    let text_size = 20pt

    if it.level != 1 {
      text_size = 18pt - (it.level * 2pt)
    }

    set text(weight: "bold", size: text_size)

    block(above: 1.5em, below: 1.5em, {
      if (it.numbering != none) {
        counter(heading).display(it.numbering)
        h(0.8em)
      }
      it.body
    })
  }
  show outline.entry.where(level: 1): it => {
    block(above: 2em, it)
  }
  show cite: it => {
    smallcaps(it)
  }

  set page(numbering: "I")
  counter(page).update(1)

  pagebreak()

  heading(level: 1, numbering: none, outlined: false, "Kurzfassung")
  abstract

  heading(level: 1, numbering: none, outlined: false, "Abstract")
  abstract_alt

  pagebreak()

  heading(numbering: none, outlined: false, "Inhaltsverzeichnis")
  {
    show outline.entry.where(level: 1): it => {
      set text(weight: "bold")
      it
    }
    outline(title: none)
  }

  pagebreak()

  heading(numbering: none, "Abbildungsverzeichnis")
  outline(target: figure.where(kind: image), title: none)

  pagebreak()

  heading(numbering: none, "Tabellenverzeichnis")
  outline(target: figure.where(kind: table), title: none)

  set page(numbering: "1")
  counter(page).update(1)

  doc
}

// Display a new chapter heading.
//
// This automatically inserts a pagebreak before the heading and resets the figure counter.
//
// - content (content): The chapter name.
#let chapter(content) = {
  show heading: it => {
    pagebreak()
    v(3.2em)
    table(
      stroke: none,
      columns: (auto, 1fr),
      inset: (x: 0.5em, y: 0.5em),
      pad(left: 1em, text(size: 56pt, weight: "bold", context counter(heading).display())),
      table(columns: 1fr, stroke: none, text(weight: "bold", size: 12pt, "Kapitel"), inset: (
          x: 0pt,
          y: 6pt,
        ), table.hline(
          stroke: 0.5pt,
        ), text(weight: "bold", size: 20pt, it.body)),
    )
  }

  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)

  heading(content)
}

// Display a quotation.
//
// - content (content): The content of the quotation.
// - footer (content): The footer, usually the source of the quotation or some other footnote.
#let quotation(content, footer) = {
  box(fill: rgb("fff9e5"), stroke: 0.5pt + rgb("#efe4bf"), inset: 4pt, table(
    stroke: none,
    columns: (auto, 1fr),
    text(size: 48pt, weight: "bold", sym.quote.r.double),
    table(stroke: none, inset: 0pt, columns: 1fr, text(size: 10pt, content), {
        set text(size: 10pt)
        set align(right)
        pad(top: 8pt, footer)
      }),
  ))
}

// Display a paragraph with hanging indent, usually used for enumerations or the like.
//
// - content (content): The content to display, usually starting with a bold word separated by a colon.
#let hanging(content) = {
  par(hanging-indent: 4.2em, content)
}

// Display a note on the right side of the page.
//
// - content (content): The content to display. Make sure this is not too long.
#let sidenote(content) = {
  marge.sidenote(side: right, padding: 1em, {
    set text(size: 8pt)
    content
  })
}
